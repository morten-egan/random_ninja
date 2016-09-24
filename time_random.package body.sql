create or replace package body time_random

as

  function r_second
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_second');

    l_ret_var := core_random.r_natural(0,59);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_second;

  function r_minute
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_minute');

    l_ret_var := core_random.r_natural(0,59);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_minute;

  function r_hour (
    r_ampmformat              boolean       default false
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_hour');

    if r_ampmformat then
      l_ret_var := core_random.r_natural(1,12);
    else
      l_ret_var := core_random.r_natural(0,23);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_hour;

  function r_ampm
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_ampm');

    if core_random.r_bool then
      l_ret_var := 'am';
    else
      l_ret_var := 'pm';
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_ampm;

  function r_millisecond
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_millisecond');

    l_ret_var := core_random.r_natural(0,999);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_millisecond;

  function r_year (
    r_min                     number        default 1920
    , r_max                   number        default to_number(to_char(sysdate,'YYYY'))
    , r_twodigit              boolean       default false
  )
  return number

  as

    l_ret_var               number;
    l_twodigit_min          number;
    l_twodigit_max          number;

  begin

    dbms_application_info.set_action('r_year');

    if r_twodigit then
      if r_min = 1920 then
        l_twodigit_min := 0;
      else
        l_twodigit_min := r_min;
      end if;
      if r_max = to_number(to_char(sysdate,'YYYY')) then
        l_twodigit_max := to_number(to_char(sysdate,'YY'));
      else
        l_twodigit_max := r_max;
      end if;
      l_ret_var := core_random.r_natural(l_twodigit_min,l_twodigit_max);
    else
      l_ret_var := core_random.r_natural(r_min, r_max);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_year;

  function r_month (
    r_season                  varchar2      default null
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_month');

    if r_season = 'winter' then
      l_ret_var := core_random.r_natural(0,2);
      if l_ret_var = 0 then
        l_ret_var := 12;
      end if;
    elsif r_season = 'spring' then
      l_ret_var := core_random.r_natural(3,5);
    elsif r_season = 'summer' then
      l_ret_var := core_random.r_natural(6,8);
    elsif r_season = 'autumn' then
      l_ret_var := core_random.r_natural(9,11);
    else
      l_ret_var := core_random.r_natural(1,12);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_month;

  function r_day (
    r_month                   number        default null
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_day');

    if r_day.r_month is null then
      l_ret_var := core_random.r_natural(1,28);
    else
      if r_day.r_month in (1,3,5,7,8,10,12) then
        l_ret_var := core_random.r_natural(1,31);
      elsif r_day.r_month in (4,6,9,11) then
        l_ret_var := core_random.r_natural(1,30);
      else
        l_ret_var := core_random.r_natural(1,28);
      end if;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_day;

  function r_date (
    r_year                    number        default null
    , r_month                 number        default null
    , r_day                   number        default null
    , r_hour                  number        default null
    , r_minute                number        default null
    , r_second                number        default null
    , r_ampmformat            boolean       default false
  )
  return date

  as

    l_ret_var               date;
    l_year                  number := r_date.r_year;
    l_month                 number := r_date.r_month;
    l_day                   number := r_date.r_day;
    l_hour                  number := r_date.r_hour;
    l_minute                number := r_date.r_minute;
    l_second                number := r_date.r_second;

  begin

    dbms_application_info.set_action('r_date');

    if l_year is null then
      l_year := time_random.r_year;
    end if;

    if l_month is null then
      l_month := time_random.r_month;
    end if;

    if l_day is null then
      l_day := time_random.r_day(l_month);
    end if;

    if l_hour is null then
      l_hour := time_random.r_hour;
    end if;

    if l_minute is null then
      l_minute := time_random.r_minute;
    end if;

    if l_second is null then
      l_second := time_random.r_second;
    end if;

    l_ret_var := to_date(l_day || '/' || l_month || '/' || l_year || ' ' || l_hour || ':' || l_minute || ':' || l_second, 'DD/MM/YYYY HH24:MI:SS');

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_date;

begin

  dbms_application_info.set_client_info('time_random');
  dbms_session.set_identifier('time_random');

end time_random;
/
