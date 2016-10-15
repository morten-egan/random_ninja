create or replace package body person_random

as

  function r_age (
    r_type            varchar2        default null
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_age');

    if r_type = 'child' then
      l_ret_var := core_random.r_natural(0,12);
    elsif r_type = 'teen' then
      l_ret_var := core_random.r_natural(13,19);
    elsif r_type = 'adult' then
      l_ret_var := core_random.r_natural(18,65);
    elsif r_type = 'senior' then
      l_ret_var := core_random.r_natural(65,100);
    elsif r_type = 'all' then
      l_ret_var := core_random.r_natural(0,100);
    else
      l_ret_var := core_random.r_natural(18,65);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_age;

  function r_birthday (
    r_type            varchar2        default null
    , r_fixed         boolean         default false
  )
  return date

  as

    l_ret_var               date;
    l_age                   number;
    l_year                  number;

  begin

    dbms_application_info.set_action('r_birthday');

    l_age := r_age(r_type);
    l_year := to_number(to_char(add_months(trunc(sysdate,'YYYY'), -l_age*12), 'YYYY'));

    l_ret_var := time_random.r_date(
      r_year => l_year
    );

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_birthday;

  function r_firstname (
    r_country         varchar2        default null
    , r_gender        varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country_code          varchar2(10) := r_country;
    l_gender                varchar2(20) := r_gender;

  begin

    dbms_application_info.set_action('r_firstname');

    if l_country_code is null then
      l_country_code := 'US';
    end if;

    if l_gender is null then
      l_gender := person_random.r_gender(false);
    end if;

    if l_gender = 'male' then
      l_ret_var := names_data.r_country_names(l_country_code).male_first_names(core_random.r_natural(1,100));
    elsif l_gender = 'female' then
      l_ret_var := names_data.r_country_names(l_country_code).female_first_names(core_random.r_natural(1,100));
    else
      -- In case something went wrong, return a female name.
      l_ret_var := names_data.r_country_names(l_country_code).female_first_names(core_random.r_natural(1,100));
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_firstname;

  function r_middlename (
    r_country         varchar2        default null
    , r_gender        varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country_code          varchar2(10) := r_country;
    l_gender                varchar2(20) := r_gender;

  begin

    dbms_application_info.set_action('r_middlename');

    if l_country_code is null then
      l_country_code := 'US';
    end if;

    if l_gender is null then
      l_gender := person_random.r_gender(false);
    end if;

    if l_gender = 'male' then
      l_ret_var := names_data.r_country_names(l_country_code).male_middle_names(core_random.r_natural(1,100));
    elsif l_gender = 'female' then
      l_ret_var := names_data.r_country_names(l_country_code).female_middle_names(core_random.r_natural(1,100));
    else
      -- In case something went wrong, return a female name.
      l_ret_var := names_data.r_country_names(l_country_code).female_middle_names(core_random.r_natural(1,100));
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_middlename;

  function r_lastname (
    r_country         varchar2        default null
    , r_gender        varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country_code          varchar2(10) := r_country;
    l_gender                varchar2(20) := r_gender;

  begin

    dbms_application_info.set_action('r_lastname');

    if l_country_code is null then
      l_country_code := 'US';
    end if;

    if l_gender is null then
      l_gender := person_random.r_gender(false);
    end if;

    if l_gender = 'male' then
      l_ret_var := names_data.r_country_names(l_country_code).last_names(core_random.r_natural(1,100));
    elsif l_gender = 'female' then
      l_ret_var := names_data.r_country_names(l_country_code).last_names(core_random.r_natural(1,100));
    else
      -- In case something went wrong, return a female name.
      l_ret_var := names_data.r_country_names(l_country_code).last_names(core_random.r_natural(1,100));
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_lastname;

  function r_gender (
    r_shortform       boolean         default true
    , r_allowother    boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_gender');

    if core_random.r_bool then
      if r_shortform then
        l_ret_var := 'F';
      else
        l_ret_var := 'female';
      end if;
    else
      if r_shortform then
        l_ret_var := 'M';
      else
        l_ret_var := 'male';
      end if;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_gender;

  function r_prefix (
    r_gender          varchar2        default null
    , r_country       varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_gender                varchar2(100) := r_gender;
    l_country_code          varchar2(10) := r_country;

  begin

    dbms_application_info.set_action('r_prefix');

    if l_country_code is null then
      -- Pick a country from the countries implemented for names.
      l_country_code := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    end if;

    if l_gender is null then
      l_gender := person_random.r_gender;
    end if;

    if l_gender = 'male' or l_gender = 'M' then
      l_ret_var := util_random.ru_pickone(names_data.r_country_names(l_country_code).all_prefix || ',' || names_data.r_country_names(l_country_code).male_prefix);
    elsif l_gender = 'female' or l_gender = 'F' then
      l_ret_var := util_random.ru_pickone(names_data.r_country_names(l_country_code).all_prefix || ',' || names_data.r_country_names(l_country_code).female_prefix);
    else
      l_ret_var := util_random.ru_pickone(names_data.r_country_names(l_country_code).all_prefix || ',' || names_data.r_country_names(l_country_code).male_prefix || ',' || names_data.r_country_names(l_country_code).female_prefix);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_prefix;

  function r_name (
    r_country         varchar2        default null
    , r_gender        varchar2        default null
    , r_middle        boolean         default false
    , r_middleinitial boolean         default false
    , r_prefix        boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(200);
    l_country_code          varchar2(10) := r_country;
    l_gender                varchar2(20) := r_gender;

    l_first                 varchar2(100);
    l_middle                varchar2(100);
    l_last                  varchar2(100);
    l_prefix                varchar2(20);

  begin

    dbms_application_info.set_action('r_name');

    if l_country_code is null then
      -- Pick a country from the countries implemented for names.
      l_country_code := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    end if;

    if l_gender is null then
      l_gender := person_random.r_gender(false);
    end if;

    l_first := person_random.r_firstname(l_country_code, l_gender);
    if r_middle then
      l_middle := person_random.r_middlename(l_country_code, l_gender);
    end if;
    if r_middleinitial then
      l_middle := substr(person_random.r_middlename(l_country_code, l_gender), 1, 1);
    end if;
    l_last := person_random.r_lastname(l_country_code, l_gender);

    if r_middle or r_middleinitial then
      l_ret_var := l_first || ' ' || l_middle || ' ' || l_last;
    else
      l_ret_var := l_first || ' ' || l_last;
    end if;

    if r_prefix then
      l_prefix := person_random.r_prefix(l_gender, l_country_code);
      l_ret_var := l_prefix || ' ' || l_ret_var;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_name;

  function r_identification (
    r_country         varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country_code          varchar2(20) := r_country;

  begin

    dbms_application_info.set_action('r_identification');

    if l_country_code is null then
      l_country_code := util_random.ru_pickone(core_random_v.g_id_countries_implemented);
    end if;

    if l_country_code = 'US' then
      l_ret_var := core_random.r_string(3, '0123456789') || '-' || core_random.r_string(2, '0123456789') || '-' || core_random.r_string(4, '0123456789');
    else
      l_ret_var := core_random.r_string(3, '0123456789') || '-' || core_random.r_string(2, '0123456789') || '-' || core_random.r_string(4, '0123456789');
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_identification;

  function r_suffix (
    r_country         varchar2        default null
    , r_shortform     boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(10) := r_country;

  begin

    dbms_application_info.set_action('r_suffix');

    if l_country is null then
      l_country := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    end if;

    if r_shortform then
      l_ret_var := util_random.ru_pickone(names_data.r_country_names(l_country).suffix_short);
    else
      l_ret_var := util_random.ru_pickone(names_data.r_country_names(l_country).suffix_full);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_suffix;

begin

  dbms_application_info.set_client_info('person_random');
  dbms_session.set_identifier('person_random');

end person_random;
/
