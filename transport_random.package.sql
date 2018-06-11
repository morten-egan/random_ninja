create or replace package transport_random

as

  /** Generate random transport related data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  /** Generate a random IMO registration.
  * @author Morten Egan
  * @return varchar2 The IMO generated.
  */
  function r_imo
  return varchar2;

  /** Generate a random icao registration number.
  * @author Morten Egan
  * @return varchar2 The icao registration number generated.
  */
  function r_icao (
    r_country         varchar2        default core_random_v.g_default_country_code
  )
  return varchar2;

  /** Generate a random vehicle registration number.
  * @author Morten Egan
  * @return varchar2 The generated license plate.
  */
  function r_vehicle_registration (
    r_country         varchar2        default core_random_v.g_default_country_code
  )
  return varchar2;

end transport_random;
/
