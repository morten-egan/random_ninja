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
    , r_morethan              number        default null
    , r_lessthan              number        default null
  )
  return number

  as

    l_ret_var               number;
    l_morethan              number := r_month.r_morethan;
    l_lessthan              number := r_month.r_lessthan;

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
      if l_morethan is null then
        l_morethan := 1;
      end if;
      if l_lessthan is null then
        l_lessthan := 12;
      end if;
      l_ret_var := core_random.r_natural(l_morethan,l_lessthan);
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
    , r_morethan              number        default null
    , r_lessthan              number        default null
  )
  return number

  as

    l_ret_var               number;
    l_month                 number := r_day.r_month;
    l_morethan              number := r_day.r_morethan;
    l_lessthan              number := r_day.r_lessthan;

  begin

    dbms_application_info.set_action('r_day');

    if l_month is null then
      l_month := time_random.r_month;
    end if;

    if l_lessthan is null then
      if l_month = 2 then
        l_lessthan := 28;
      elsif l_month in (1,3,5,7,8,10,12) then
        l_lessthan := 31;
      elsif l_month in (4,6,9,11) then
        l_lessthan := 30;
      end if;
    end if;

    if l_morethan is null then
      l_morethan := 1;
    end if;

    l_ret_var := core_random.r_natural(l_morethan,l_lessthan);

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

  function r_epoch
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_epoch');

    l_ret_var := core_random.r_natural(1, (sysdate - to_date('1970-01-01', 'YYYY-MM-DD'))* 86400000);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_epoch;

  function r_timestamp (
    r_year                    number        default null
    , r_month                 number        default null
    , r_day                   number        default null
    , r_hour                  number        default null
    , r_minute                number        default null
    , r_second                number        default null
    , r_millisecond           number        default null
    , r_ampmformat            boolean       default false
  )
  return timestamp

  as

    l_ret_var               timestamp;
    l_year                  number := r_timestamp.r_year;
    l_month                 number := r_timestamp.r_month;
    l_day                   number := r_timestamp.r_day;
    l_hour                  number := r_timestamp.r_hour;
    l_minute                number := r_timestamp.r_minute;
    l_second                number := r_timestamp.r_second;
    l_millisecond           number := r_timestamp.r_millisecond;

  begin

    dbms_application_info.set_action('r_timestamp');

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

    if l_millisecond is null then
      l_millisecond := time_random.r_millisecond;
    end if;

    l_ret_var := to_timestamp(l_day || '/' || l_month || '/' || l_year || ' ' || l_hour || ':' || l_minute || ':' || l_second || ':' || l_millisecond, 'DD/MM/YYYY HH24:MI:SS:FF3');

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_timestamp;

  function r_datebetween (
    r_date_from               date
    , r_date_to               date          default sysdate
  )
  return date

  as

    l_ret_var               date;
    l_year_from             number := to_char(r_date_from,'YYYY');
    l_year_to               number := to_char(r_date_to,'YYYY');
    l_year                  number;
    l_month_from            number := to_char(r_date_from, 'MM');
    l_month_to              number := to_char(r_date_to, 'MM');
    l_month                 number;
    l_day_from              number := to_char(r_date_from, 'DD');
    l_day_to                number := to_char(r_date_to, 'DD');
    l_day                   number;

  begin

    dbms_application_info.set_action('r_datebetween');

    -- First set year.
    l_year := time_random.r_year(l_year_from, l_year_to);

    -- Second we define the month. If year is same as from, it has to be higher. If year is same as to, it has to be less.
    -- If year is same, it has to be between.
    if l_year_from = l_year_to then
      l_month := time_random.r_month(null, l_month_from, l_month_to);
    elsif (l_year_to = l_year_from + 1) and l_year = l_year_to then
      l_month := time_random.r_month(null, 1, l_month_to);
    elsif (l_year_to = l_year_from + 1) and l_year = l_year_from then
      l_month := time_random.r_month(null, l_month_from, 12);
    else
      l_month := time_random.r_month;
    end if;

    -- Lastly we define the day. For this we need to check if we are in the same year and month, same year month after, else
    -- we just need to make sure that day is below to year/month/day.
    if l_year_from = l_year_to and l_month_from = l_month_to then
      -- Day should be between.
      l_day := time_random.r_day(l_month, l_day_from, l_day_to);
    elsif l_year_from = l_year_to and l_month = l_month_from + 1 then
      l_day := time_random.r_day(l_month, null, l_day_to);
    else
      l_day := time_random.r_day(l_month);
    end if;

    l_ret_var := r_date(l_year, l_month, l_day);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_datebetween;

  function r_datereference (
    r_reference               varchar2      default null
  )
  return date

  as

    l_ret_var               date;
    l_reference             varchar2(100) := r_reference;

  begin

    dbms_application_info.set_action('r_datereference');

    if l_reference is null then
      l_reference := util_random.ru_pickone(core_random_v.g_datereference_options);
    end if;

    if l_reference = 'recent' then
      l_ret_var := time_random.r_datebetween(sysdate - 365, sysdate -1);
    elsif l_reference = 'past' then
      l_ret_var := time_random.r_datebetween(sysdate - (365*1200), sysdate - (365*5));
    elsif l_reference = 'future' then
      l_ret_var := time_random.r_datebetween(sysdate + (365*5), sysdate + (365*200));
    elsif l_reference = 'soon' then
      l_ret_var := time_random.r_datebetween(sysdate + 1, sysdate + 365);
    else
      l_ret_var := time_random.r_datebetween(sysdate - 10, sysdate + 10);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_datereference;

  function r_timebetween (
    r_timestamp_from          timestamp
    , r_timestamp_to          timestamp     default systimestamp
  )
  return timestamp

  as

    l_ret_var               timestamp;
    l_tmp_date              date;

  begin

    dbms_application_info.set_action('r_timebetween');

    l_tmp_date := time_random.r_datebetween(to_date(to_char(r_timestamp_from, 'DD-MM-YYYY HH24:MI:SS'), 'DD-MM-YYYY HH24:MI:SS'), to_date(to_char(r_timestamp_to, 'DD-MM-YYYY HH24:MI:SS'), 'DD-MM-YYYY HH24:MI:SS'));

    l_ret_var := to_timestamp(to_char(l_tmp_date, 'DD-MM-YYYY HH24:MI:SS') || ':' || time_random.r_millisecond, 'DD-MM-YYYY HH24:MI:SS:FF3');

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_timebetween;

begin

  dbms_application_info.set_client_info('time_random');
  dbms_session.set_identifier('time_random');

end time_random;
/
