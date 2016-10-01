create or replace package person_random

as

  /** Generate random person related data, such as Age, Gender, Name and more.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  /** Generate a random age.
  * @author Morten Egan
  * @return number The generated age. Default between 18 and 65.
  */
  function r_age (
    r_type            varchar2        default null
  )
  return number;

  /** Generate a random birthday
  * @author Morten Egan
  * @return date The birthday generated. Set fixed to true, to set time, day and month to same as local current time.
  */
  function r_birthday (
    r_type            varchar2        default null
    , r_fixed         boolean         default false
  )
  return date;

  /** Generate a random first name.
  * @author Morten Egan
  * @return varchar2 The first name
  */
  function r_firstname (
    r_country         varchar2        default null
    , r_gender        varchar2        default null
  )
  return varchar2;

  /** Generate a random middle name.
  * @author Morten Egan
  * @return varchar2 The middle name generated.
  */
  function r_middlename (
    r_country         varchar2        default null
    , r_gender        varchar2        default null
  )
  return varchar2;

  /** Generate a random last name.
  * @author Morten Egan
  * @return varchar2 The last name generated.
  */
  function r_lastname (
    r_country         varchar2        default null
    , r_gender        varchar2        default null
  )
  return varchar2;

  /** Generate a full name, with options for country, gender, middlename, prefix, suffix etc.
  * @author Morten Egan
  * @return varchar2 The full name generated.
  */
  function r_name (
    r_country         varchar2        default null
    , r_gender        varchar2        default null
    , r_middle        boolean         default false
    , r_middleinitial boolean         default false
    , r_prefix        boolean         default false
  )
  return varchar2;

  /** Generate a random gender for a person.
  * @author Morten Egan
  * @return varchar2 The gender generated.
  */
  function r_gender (
    r_shortform       boolean         default true
    , r_allowother    boolean         default false
  )
  return varchar2;

  /** Generate a random prefix to a name.
  * @author Morten Egan
  * @return varchar2 The prefix generated.
  */
  function r_prefix (
    r_gender          varchar2        default null
    , r_country       varchar2        default null
  )
  return varchar2;

end person_random;
/
