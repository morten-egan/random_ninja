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

end util_random;
/
