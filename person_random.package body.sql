create or replace package body person_random

as

  function r_age (
    r_type            varchar2        default null
    , r_min           number          default null
    , r_max           number          default null
  )
  return number

  as

    l_ret_var               number;
    l_min                   number := r_min;
    l_max                   number := r_max;

  begin

    dbms_application_info.set_action('r_age');

    if l_min is null and l_max is null then
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
    else
      if l_min is null then
        l_min := core_random.r_natural(0, l_max - 1);
      elsif l_max is null then
        l_max := core_random.r_natural(l_min + 1, 100);
      end if;
      l_ret_var := core_random.r_natural(l_min, l_max);
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
    , r_min           number          default null
    , r_max           number          default null
  )
  return date

  as

    l_ret_var               date;
    l_age                   number;
    l_year                  number;
    l_min                   number := r_min;
    l_max                   number := r_max;

  begin

    dbms_application_info.set_action('r_birthday');

    l_age := r_age(r_type, l_min, l_max);
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
    l_country_code          varchar2(10) := upper(r_country);
    l_gender                varchar2(20) := upper(r_gender);

  begin

    dbms_application_info.set_action('r_firstname');

    if l_country_code is null then
      l_country_code := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    elsif not util_random.ru_inlist(core_random_v.g_name_countries_implemented, l_country_code) then
      l_country_code := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    end if;

    if l_gender is null or l_gender not in ('F', 'M', 'MALE', 'FEMALE') then
      l_gender := upper(person_random.r_gender(false));
    end if;

    if l_gender = 'MALE' or l_gender = 'M' then
      l_ret_var := names_data.r_country_names(l_country_code).male_first_names(core_random.r_natural(1,100));
    elsif l_gender = 'FEMALE' or l_gender = 'F' then
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
    l_country_code          varchar2(10) := upper(r_country);
    l_gender                varchar2(20) := upper(r_gender);

  begin

    dbms_application_info.set_action('r_middlename');

    if l_country_code is null then
      l_country_code := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    elsif not util_random.ru_inlist(core_random_v.g_name_countries_implemented, l_country_code) then
      l_country_code := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    end if;

    if l_gender is null or l_gender not in ('F', 'M', 'MALE', 'FEMALE') then
      l_gender := upper(person_random.r_gender(false));
    end if;

    if l_gender = 'MALE' or l_gender = 'M' then
      l_ret_var := names_data.r_country_names(l_country_code).male_middle_names(core_random.r_natural(1,names_data.r_country_names(l_country_code).male_middle_names.count));
    elsif l_gender = 'FEMALE' or l_gender = 'F' then
      l_ret_var := names_data.r_country_names(l_country_code).female_middle_names(core_random.r_natural(1,names_data.r_country_names(l_country_code).male_middle_names.count));
    else
      -- In case something went wrong, return a female name.
      l_ret_var := names_data.r_country_names(l_country_code).female_middle_names(core_random.r_natural(1,names_data.r_country_names(l_country_code).male_middle_names.count));
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
    l_country_code          varchar2(10) := upper(r_country);
    l_gender                varchar2(20) := upper(r_gender);

  begin

    dbms_application_info.set_action('r_lastname');

    if l_country_code is null then
      l_country_code := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    elsif not util_random.ru_inlist(core_random_v.g_name_countries_implemented, l_country_code) then
      l_country_code := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    end if;

    if l_gender is null or l_gender not in ('F', 'M', 'MALE', 'FEMALE') then
      l_gender := upper(person_random.r_gender(false));
    end if;

    if l_gender = 'MALE' or l_gender = 'M' then
      l_ret_var := names_data.r_country_names(l_country_code).last_names(core_random.r_natural(1,names_data.r_country_names(l_country_code).last_names.count));
    elsif l_gender = 'FEMALE' or l_gender = 'F' then
      l_ret_var := names_data.r_country_names(l_country_code).last_names(core_random.r_natural(1,names_data.r_country_names(l_country_code).last_names.count));
    else
      -- In case something went wrong, return a female name.
      l_ret_var := names_data.r_country_names(l_country_code).last_names(core_random.r_natural(1,names_data.r_country_names(l_country_code).last_names.count));
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
    l_gender                varchar2(100) := upper(r_gender);
    l_country_code          varchar2(10) := upper(r_country);

  begin

    dbms_application_info.set_action('r_prefix');

    if l_country_code is null then
      l_country_code := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    elsif not util_random.ru_inlist(core_random_v.g_name_countries_implemented, l_country_code) then
      l_country_code := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    end if;

    if l_gender is null or l_gender not in ('F', 'M', 'MALE', 'FEMALE') then
      l_gender := upper(person_random.r_gender(false));
    end if;

    if l_gender = 'MALE' or l_gender = 'M' then
      l_ret_var := util_random.ru_pickone(names_data.r_country_names(l_country_code).all_prefix || ',' || names_data.r_country_names(l_country_code).male_prefix);
    elsif l_gender = 'FEMALE' or l_gender = 'F' then
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
    l_country_code          varchar2(10) := upper(r_country);
    l_gender                varchar2(20) := upper(r_gender);

    l_first                 varchar2(100);
    l_middle                varchar2(100);
    l_last                  varchar2(100);
    l_prefix                varchar2(20);

  begin

    dbms_application_info.set_action('r_name');

    if l_country_code is null then
      l_country_code := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    elsif not util_random.ru_inlist(core_random_v.g_name_countries_implemented, l_country_code) then
      l_country_code := util_random.ru_pickone(core_random_v.g_name_countries_implemented);
    end if;

    if l_gender is null or l_gender not in ('F', 'M', 'MALE', 'FEMALE') then
      l_gender := upper(person_random.r_gender(false));
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
    , r_gender        varchar2        default null
    , r_birthday      date            default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(20) := r_identification.r_country;
    l_gender                varchar2(10) := r_identification.r_gender;
    l_birthday              date := r_identification.r_birthday;

  begin

    dbms_application_info.set_action('r_identification');

    if l_country is null then
      l_country := util_random.ru_pickone(core_random_v.g_id_countries_implemented);
    else
      if not util_random.ru_inlist(core_random_v.g_id_countries_implemented, l_country) then
        l_country := util_random.ru_pickone(core_random_v.g_id_countries_implemented);
      end if;
    end if;

    if l_gender is null then
      l_gender := person_random.r_gender;
    end if;

    if l_birthday is null then
      l_birthday := person_random.r_birthday('adult');
    end if;

    if l_gender = 'male' then
      l_ret_var := person_data.country_ids(l_country).id_format_male;
    else
      l_ret_var := person_data.country_ids(l_country).id_format_female;
    end if;

    -- First simple numbers.
    l_ret_var := util_random.ru_numcharfy(l_ret_var);
    -- Then ranges
    l_ret_var := util_random.ru_replace_ranges(l_ret_var);
    -- Then date parts.
    if l_birthday is not null then
      l_ret_var := util_random.ru_datify(l_ret_var, l_birthday);
    end if;
    -- Finally format to display
    l_ret_var := util_random.ru_display_format(l_ret_var, person_data.country_ids(l_country).id_display_format);

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

  function r_jobsector (
    r_country         varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(150);
    l_country               varchar2(10) := r_jobsector.r_country;

  begin

    dbms_application_info.set_action('r_jobsector');

    if l_country is null then
      l_country := util_random.ru_pickone(core_random_v.g_job_data_implemented);
    elsif not util_random.ru_inlist(core_random_v.g_job_data_implemented, l_country) then
      l_country := util_random.ru_pickone(core_random_v.g_job_data_implemented);
    end if;

    l_ret_var := person_data.country_jobs(l_country)(core_random.r_natural(1, person_data.country_jobs(l_country).count)).job_sector;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_jobsector;

  function r_jobtitle (
    r_country         varchar2        default null
    , r_jobsector     varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(10) := r_jobtitle.r_country;
    l_jobsector             varchar2(150) := r_jobtitle.r_jobsector;
    l_jobsector_idx         number;

  begin

    dbms_application_info.set_action('r_jobtitle');

    if l_country is null then
      l_country := util_random.ru_pickone(core_random_v.g_job_data_implemented);
    elsif not util_random.ru_inlist(core_random_v.g_job_data_implemented, l_country) then
      l_country := util_random.ru_pickone(core_random_v.g_job_data_implemented);
    end if;

    if l_jobsector is null then
      l_ret_var := util_random.ru_pickone(person_data.country_jobs(l_country)(core_random.r_natural(1, person_data.country_jobs(l_country).count)).job_titles);
    else
      for i in 1..person_data.country_jobs(l_country).count loop
        if person_data.country_jobs(l_country)(i).job_sector = l_jobsector then
          l_jobsector_idx := i;
        end if;
      end loop;
      if l_jobsector_idx is null then
        l_jobsector_idx := core_random.r_natural(1, person_data.country_jobs(l_country).count);
      end if;
      l_ret_var := util_random.ru_pickone(person_data.country_jobs(l_country)(l_jobsector_idx).job_titles);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_jobtitle;

  function r_salary (
    r_country         varchar2        default null
    , r_jobsector     varchar2        default null
    , r_min           number          default null
    , r_max           number          default null
  )
  return number

  as

    l_ret_var               number;
    l_country               varchar2(10) := r_salary.r_country;
    l_jobsector             varchar2(150) := r_salary.r_jobsector;
    l_jobsector_idx         number;

  begin

    dbms_application_info.set_action('r_salary');

    if r_min is null and r_max is null then
      if l_country is null then
        l_country := util_random.ru_pickone(core_random_v.g_job_data_implemented);
      elsif not util_random.ru_inlist(core_random_v.g_job_data_implemented, l_country) then
        l_country := util_random.ru_pickone(core_random_v.g_job_data_implemented);
      end if;

      if l_jobsector is null then
        l_jobsector_idx := core_random.r_natural(1, person_data.country_jobs(l_country).count);
        l_ret_var := core_random.r_natural(person_data.country_jobs(l_country)(l_jobsector_idx).salary_range_min, person_data.country_jobs(l_country)(l_jobsector_idx).salary_range_max);
      else
        for i in 1..person_data.country_jobs(l_country).count loop
          if person_data.country_jobs(l_country)(i).job_sector = l_jobsector then
            l_jobsector_idx := i;
          end if;
        end loop;
        if l_jobsector_idx is null then
          l_jobsector_idx := core_random.r_natural(1, person_data.country_jobs(l_country).count);
        end if;
        l_ret_var := core_random.r_natural(person_data.country_jobs(l_country)(l_jobsector_idx).salary_range_min, person_data.country_jobs(l_country)(l_jobsector_idx).salary_range_max);
      end if;
    else
      -- Specific salary range requested.
      l_ret_var := core_random.r_natural(r_min, r_max);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_salary;

begin

  dbms_application_info.set_client_info('person_random');
  dbms_session.set_identifier('person_random');

end person_random;
/
