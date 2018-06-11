create or replace package phone_random

as

  /** Generate random phone related data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

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
    r_country               varchar2      default core_random_v.g_default_country_code
    , r_useplus             boolean       default true
  )
  return varchar2;

  /** Generate a random phone number.
  * @author Morten Egan
  * @return varchar2 The number generated.
  */
  function r_phonenumber (
    r_country                 varchar2      default core_random_v.g_default_country_code
    , r_include_country_code  boolean       default false
    , r_landline              boolean       default false
    , r_mobile                boolean       default false
  )
  return varchar2;

  /** Get a random MCC (Mobile Country Code)
  * @author Morten Egan
  * @return number The MCC selected from the data list or generated.
  */
  function r_mcc (
    r_country                 varchar2      default core_random_v.g_default_country_code
  )
  return number;

  /** Get a random MNC number.
  * @author Morten Egan
  * @return number The MNC generated.
  */
  function r_mnc (
    r_country                 varchar2      default core_random_v.g_default_country_code
  )
  return varchar2;

  /** Generate a random IMSI number that follows E.212 ITU standard.
  * @author Morten Egan
  * @return number The IMSI number generated.
  */
  function r_imsi (
    r_country                 varchar2      default core_random_v.g_default_country_code
  )
  return number;

  /** Generate a random call type for a CDR record.
  * @author Morten Egan
  * @return varchar2 The call type generated.
  */
  function r_call_type
  return varchar2;

  /** Generate a random call type service for a CDR record.
  * @author Morten Egan
  * @return varchar2 The call type service generated.
  */
  function r_call_type_service
  return varchar2;

  /** Generate a random operator code (pmnl) for CDR records.
  * @author Morten Egan
  * @return number Operator code generated.
  */
  function r_operator_code (
    r_country                 varchar2      default core_random_v.g_default_country_code
  )
  return number;

  /** Generate a random phone brand.
  * @author Morten Egan
  * @return varchar2 The brand generated.
  */
  function r_brand
  return varchar2;

end phone_random;
/
