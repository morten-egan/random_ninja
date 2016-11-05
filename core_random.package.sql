create or replace package core_random

as

  /** This is the core implementation of the randomizing functions.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  /** Get a random boolean value.
  * @author Morten Egan
  * @return boolean Randomly return true or false.
  */
  function r_bool (
    r_likelyhood      number           default 50
  )
  return boolean;

  /** Get a random natural number.
  * @author Morten Egan
  * @return number The random number to return.
  */
  function r_natural (
    r_min             number          default 0
    , r_max           number          default 9007199254740992
    , r_w_min         number          default null
    , r_w_max         number          default null
    , r_weight        number          default null
  )
  return number;

  /** Return a random character.
  * @author Morten Egan
  * @return varchar2 The random chosen character.
  */
  function r_character (
    r_pool            varchar2        default null
    , r_alpha         boolean         default false
    , r_casing        varchar2        default 'mixed'
    , r_symbols       boolean         default false
  )
  return varchar2;

  /** Get random float number.
  * @author Morten Egan
  * @return number The random float picked.
  */
  function r_float (
    r_fixed           number          default 4
    , r_min           number          default -9007199254740992
    , r_max           number          default 9007199254740992
    , r_w_min         number          default null
    , r_w_max         number          default null
    , r_weight        number          default null
  )
  return number;

  /** Return a random integer.
  * @author Morten Egan
  * @return number The random integer generated.
  */
  function r_integer (
    r_min             number          default -9007199254740992
    , r_max           number          default 9007199254740992
  )
  return number;

  /** Return a random generated string between 5 and 20 characters length default.
  * @author Morten Egan
  * @return varchar2 The randomly generated string.
  */
  function r_string (
    r_length          number          default null
    , r_pool          varchar2        default null
  )
  return varchar2;

  /** Generate a random string in hex.
  * @author Morten Egan
  * @return varchar2 The HEX generated string.
  */
  function r_hex (
    r_length          number          default null
    , r_upper         boolean         default false
  )
  return varchar2;

end core_random;
/
