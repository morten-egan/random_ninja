create or replace package web_random

as

  /** Generate random web related data for data generation and testing.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  /** Generate a random top level domain.
  * @author Morten Egan
  * @return varchar2 The top level domain.
  */
  function r_tld (
    include_country                 boolean         default false
    , include_generic               boolean         default false
  )
  return varchar2;

  /** Generate a random domain name.
  * @author Morten Egan
  * @return varchar2 The domain name.
  */
  function r_domain (
    r_tld                           varchar2        default null
  )
  return varchar2;

  /** Generate a random email address.
  * @author Morten Egan
  * @return varchar2 The email address generated.
  */
  function r_email (
    r_firstname                     varchar2        default null
    , r_lastname                    varchar2        default null
    , r_name                        varchar2        default null
    , use_real_name                 boolean         default false
    , safe                          boolean         default false
  )
  return varchar2;

  /** Generate a random IPv4 address.
  * @author Morten Egan
  * @return varchar2 The IP address generated.
  */
  function r_ipv4
  return varchar2;

  /** Generate a random URL.
  * @author Morten Egan
  * @return varchar2 The URL generated.
  */
  function r_url (
    use_secure                      boolean         default false
    , add_query                     boolean         default false
  )
  return varchar2;

  /** Generate a random ipv6 address.
  * @author Morten Egan
  * @return varchar2 The IP address generated.
  */
  function r_ipv6
  return varchar2;

  /** Generate a random web protocol.
  * @author Morten Egan
  * @return varchar2 The random protocol.
  */
  function r_protocol
  return varchar2;

  /** Generate a random looking sha256 password.
  * @author Morten Egan
  * @return varchar2 The returned sha256.
  */
  function r_password
  return varchar2;

  /** Generate a random MAC address.
  * @author Morten Egan
  * @return varchar2 The generated MAC address.
  */
  function r_mac
  return varchar2;

  /** Generate a random RGB color.
  * @author Morten Egan
  * @return varchar2 The generated RGB color values.
  */
  function r_color
  return varchar2;

  /** Generate a bem name
  * @author Morten Egan
  * @return varchar2 The bem name.
  */
  function r_bem (
    r_bem_domain                  varchar2          default null
  )
  return varchar2;

end web_random;
/
