create or replace package util_random

as

  /** Different helper utilities to assist in the random_ninja package.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  /** Extract a numbered element from a string with a known seperator.
  * @author Morten Egan
  * @return varchar2 The n-th element returned.
  */
  function ru_extract (
    ru_elements       varchar2
    , ru_extract_n    number          default 1
    , ru_seperator    varchar2        default ','
  )
  return varchar2;

  /** Extract a random element from a list of elements in a string format.
  * This will by default use the comma character as the seperator.
  * @author Morten Egan
  * @return varchar2 The element returned.
  */
  function ru_pickone (
    ru_elements       varchar2
    , ru_seperator    varchar2        default ','
  )
  return varchar2;

  /** Calculate the Luhn check digit.
  * @author Morten Egan
  * @return number The luhn algorithm check digit.
  */
  function luhn_calculate (
    digits            varchar2
  )
  return number;

  /** Check if an element is in a string list
  * @author Morten Egan
  * @return boolean True if element exists, false if not.
  */
  function ru_inlist (
    ru_elements           varchar2
    , ru_value            varchar2
    , ru_seperator        varchar2 default ','
    , ru_case_sensitive   boolean default true
  )
  return boolean;

  /** Replace all characters with a random result from a r_****** function.
  * @author Morten Egan
  * @return varchar2 The string with the replaced string.
  */
  function ru_replace (
    ru_string             varchar2
    , ru_replace_char     varchar2 default 'X'
    , ru_replace_func     varchar2 default 'core_random.r_natural(1,9)'
  )
  return varchar2;

  /** Replace ranges with random numbers, within the range definitions.
  * @author Morten Egan
  * @return varchar2 The string with the ranges replaced with real numbers.
  */
  function ru_replace_ranges (
    ru_string             varchar2
    , ru_range_marker     varchar2 default '[]'
  )
  return varchar2;

end util_random;
/
