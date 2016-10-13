create or replace package location_random

as

  /** Generate random location related data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  /** Generate a random country.
  * @author Morten Egan
  * @return varchar2 The country name, either in full form or if specified the short form.
  */
  function r_country (
    r_shortform           boolean         default false
  )
  return varchar2;

  /** Generate a random altitude
  * @author Morten Egan
  * @return number Generate a random altitude, by default in meters. Can change to feet.
  */
  function r_height (
    r_feet                boolean         default false
    , r_livable           boolean         default true
  )
  return number;

  /** Generate a random depth.
  * @author Morten Egan
  * @return number The generated depth. Specify if wanted in feet.
  */
  function r_depth (
    r_feet                boolean         default false
    , r_onland            boolean         default false
  )
  return number;

  /** Generate a random latitude.
  * @author Morten Egan
  * @return number The latitude, in 5 decimals.
  */
  function r_latitude (
    r_precision           number          default 5
  )
  return number;

  /** Generate a random longtitude.
  * @author Morten Egan
  * @return number The longtitude in 5 decimals.
  */
  function r_longtitude (
    r_precision           number          default 5
  )
  return number;

  /** Random coordinates.
  * @author Morten Egan
  * @return varchar2 The coordinate, latitude and then longtitude comma seperated.
  */
  function r_coordinate (
    r_precision           number          default 5
  )
  return varchar2;

  /** Generate a random altitude.
  * @author Morten Egan
  * @return number The altitude, which spans from sea level (0 meters) to upper atmosphere (12192)
  */
  function r_altitude (
    r_feet                boolean         default false
  )
  return number;

  /** Generate a random state.
  * @author Morten Egan
  * @return varchar2 The state generated.
  */
  function r_state (
    r_country             varchar2        default null
    , r_shortform         boolean         default false
  )
  return varchar2;

  /** Generate a zip code
  * @author Morten Egan
  * @return number The zipcode generated.
  */
  function r_zipcode (
    r_country             varchar2        default null
  )
  return varchar2;

  /** Generate a random street name.
  * @author Morten Egan
  * @return varchar2 The street name generated.
  */
  function r_street (
    r_country             varchar2        default null
    , r_shortform         boolean         default false
    , r_syllables         number          default null
  )
  return varchar2;

  /** Generate a random address
  * @author Morten Egan
  * @return varchar2 The address generated.
  */
  function r_address (
    r_country             varchar2        default null
    , max_address_num     number          default null
    , r_shortform         boolean         default false
  )
  return varchar2;

  /** Generate a random city from location data. If country is not implemented, generate bogus city name.
  * @author Morten Egan
  * @return varchar2 The city name.
  */
  function r_city (
    r_country             varchar2        default null
    , r_state             varchar2        default null
  )
  return varchar2;

end location_random;
/
