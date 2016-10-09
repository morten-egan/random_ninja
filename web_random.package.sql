create or replace package web_random

as

  /** Generate random web related data for data generation and testing.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  /** Generate a random top level domain.
  * @author Morten Egan
  * @return varchar2 The top level domain.
  */
  function r_tld (
    include_country                 boolean         default true
    , include_generic               boolean         default true
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
    use_real_name                   boolean         default false
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

end web_random;
/
