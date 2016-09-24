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
    l_country_code          varchar2(10);
    l_gender                varchar2(20) := r_gender;

  begin

    dbms_application_info.set_action('r_firstname');

    if r_country is null then
      l_country_code := 'US';
    end if;

    if r_gender is null then
      if core_random.r_bool then
        l_gender := 'male';
      else
        l_gender := 'female';
      end if;
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
    l_country_code          varchar2(10);
    l_gender                varchar2(20) := r_gender;

  begin

    dbms_application_info.set_action('r_middlename');

    if r_country is null then
      l_country_code := 'US';
    end if;

    if r_gender is null then
      if core_random.r_bool then
        l_gender := 'male';
      else
        l_gender := 'female';
      end if;
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
    l_country_code          varchar2(10);
    l_gender                varchar2(20) := r_gender;

  begin

    dbms_application_info.set_action('r_lastname');

    if r_country is null then
      l_country_code := 'US';
    end if;

    if r_gender is null then
      if core_random.r_bool then
        l_gender := 'male';
      else
        l_gender := 'female';
      end if;
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

begin

  dbms_application_info.set_client_info('person_random');
  dbms_session.set_identifier('person_random');

end person_random;
/
