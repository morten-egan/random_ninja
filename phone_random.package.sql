create or replace package phone_random

as

  /** Generate random phone related data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  /** Generate a random IMEI number.
  * @author Morten Egan
  * @return varchar2 The IMEI number generated.
  */
  function r_imei (
    r_imeisv              boolean         default false
  )
  return varchar2;

  /** Generate a random MEID string.
  * @author Morten Egan
  * @return varchar2 The MEID identifier generated.
  */
  function r_meid
  return varchar2;

  /** Generate a international country code.
  * @author Morten Egan
  * @return varchar2 The returned international code.
  */
  function r_country_calling_code (
    r_country               varchar2      default null
    , r_useplus             boolean       default true
  )
  return varchar2;

  /** Generate a random phone number.
  * @author Morten Egan
  * @return varchar2 The number generated.
  */
  function r_phonenumber (
    r_country                 varchar2      default null
    , r_include_country_code  boolean       default false
    , r_landline              boolean       default false
    , r_mobile                boolean       default false
  )
  return varchar2;

end phone_random;
/
