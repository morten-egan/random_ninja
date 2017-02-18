create or replace package time_random

as

  /** Generate random time or date components.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.1.0';

  /** Generate a random second, in the interval from 0-59
  * @author Morten Egan
  * @return number The seconds generated.
  */
  function r_second
  return number;

  /** Generate a random minute, in the interval from 0-59
  * @author Morten Egan
  * @return number The random minute.
  */
  function r_minute
  return number;

  /** Generate a random hour. Specify if you want am-pm format.
  * @author Morten Egan
  * @return number The hour generated.
  */
  function r_hour (
    r_ampmformat              boolean       default false
  )
  return number;

  /** Generate either am or pm for 12 hour time format.
  * @author Morten Egan
  * @return varchar2 The string am or the string pm.
  */
  function r_ampm
  return varchar2;

  /** Generate a random millisecond between 0-999.
  * @author Morten Egan
  * @return number The millisecond generated.
  */
  function r_millisecond
  return number;

  /** Generate a random year
  * @author Morten Egan
  * @return number The year generated. Specify YY if you only want 2 digit format.
  */
  function r_year (
    r_min                     number        default 1920
    , r_max                   number        default to_number(to_char(sysdate,'YYYY'))
    , r_twodigit              boolean       default false
  )
  return number;

  /** Generate a random month.
  * @author Morten Egan
  * @return number The generated month number.
  */
  function r_month (
    r_season                  varchar2      default null
    , r_morethan              number        default null
    , r_lessthan              number        default null
  )
  return number;

  /** Generate a random day. If no month is specified then it will be between 1 and 28, to not cause issues for february.
  * @author Morten Egan
  * @return number The day that was generated
  */
  function r_day (
    r_month                   number        default null
    , r_morethan              number        default null
    , r_lessthan              number        default null
  )
  return number;

  /** Generate a random date. All components can be random or specified.
  * @author Morten Egan
  * @return date The date generated from the input.
  */
  function r_date (
    r_year                    number        default null
    , r_month                 number        default null
    , r_day                   number        default null
    , r_hour                  number        default null
    , r_minute                number        default null
    , r_second                number        default null
    , r_ampmformat            boolean       default false
  )
  return date;

  /** Generate a random epoch
  * @author Morten Egan
  * @return number An epoch time.
  */
  function r_epoch
  return number;

  /** Create a random timestamp. All components can be specified or generated.
  * @author Morten Egan
  * @return timestamp The randomly generated timestamp.
  */
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
  return timestamp;

  /** Generate a date between two different dates supplied.
  * @author Morten Egan
  * @return date The date generated.
  */
  function r_datebetween (
    r_date_from               date
    , r_date_to               date          default sysdate
  )
  return date;

  /** Generate a date within a "loose" timeframe.
  * @author Morten Egan
  * @return date The date generated.
  */
  function r_datereference (
    r_reference               varchar2      default null
  )
  return date;

  /** Generate a timestamp between 2 timestamps.
  * @author Morten Egan
  * @return timestamp The timestamp generated.
  */
  function r_timebetween (
    r_timestamp_from          timestamp
    , r_timestamp_to          timestamp     default systimestamp
  )
  return timestamp;

end time_random;
/
