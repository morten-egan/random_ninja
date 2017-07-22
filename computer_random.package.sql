create or replace package computer_random

as

  /** Generate random data related to computers.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  /** Generate a random OS flavor.
  * @author Morten Egan
  * @return varchar2 The flavor of OS generated.
  */
  function r_os_flavor
  return varchar2;

  /** Generate a random mountpoint. OS flavor can be specified.
  * @author Morten Egan
  * @return varchar2 The mountpoint generated.
  */
  function r_mountpoint (
    r_os_flavor         varchar2        default null
  )
  return varchar2;

  /** Generate a random file extension.
  * @author Morten Egan
  * @return varchar2 The file extension generated.
  */
  function r_extension (
    r_extension_cat     varchar2        default null
  )
  return varchar2;

  /** Generate a random filename.
  * @author Morten Egan
  * @return varchar2 The filename generated.
  */
  function r_filename (
    r_extension         varchar2        default null
    , r_extension_cat   varchar2        default null
    , r_safemode        boolean         default false
  )
  return varchar2;

  /** Generate a random path.
  * @author Morten Egan
  * @return varchar2 The path generated.
  */
  function r_path (
    r_level             number          default null
    , r_os_flavor       varchar2        default null
    , r_include_file    boolean         default true
  )
  return varchar2;

  /** Generate a random semver version.
  * @author Morten Egan
  * @return varchar2 The semver generated.
  */
  function r_semver (
    r_major             number          default null
    , r_minor           number          default null
    , r_patch           number          default null
  )
  return varchar2;

  /** Generate a random mime type.
  * @author Morten Egan
  * @return varchar2 The mime type generated.
  */
  function r_mimetype (
    r_category          varchar2        default null
  )
  return varchar2;

  /** Generate a random server name
  * @author Morten Egan
  * @return varchar2 The random server name generated.
  */
  function r_servername (
    r_environment       varchar2        default null
    , r_servertype      varchar2        default null
    , r_number          number          default null
    , r_withdomain      boolean         default true
  )
  return varchar2;

  /** Generate a random useragent string.
  * @author Morten Egan
  * @return varchar2 The useragent string generated.
  */
  function r_useragent
  return varchar2;

  /** Generate a random computer error.
  * @author Morten Egan
  * @return varchar2 The error string returned.
  */
  function r_error
  return varchar2;

end computer_random;
/
