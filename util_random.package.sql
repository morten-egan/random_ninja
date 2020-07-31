create or replace package util_random

as

  /** Different helper utilities to assist in the random_ninja package.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

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

  /** Extract random elements from a list to form new list
  * If the number of elements requested is the same as element count in original list
  * the new list will just have the order changed of the elements.
  * @author Morten Egan
  * @return varchar2 The new list generated.
  */
  function ru_picksome (
    ru_elements       varchar2
    , ru_pick_num     number          default 1
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
    , ru_partial_hit      boolean default false
  )
  return boolean;

  /** Replace all characters with a random result from a r_****** function.
  * @author Morten Egan
  * @return varchar2 The string with the replaced string.
  */
  function ru_replace (
    ru_string             varchar2
    , ru_replace_char     varchar2 default '#'
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

  /** Numerify a string, where the "#" character is replaced with a number between 0-9.
  * @author Morten Egan
  * @return varchar2 The string with the replaced characters.
  */
  function ru_numerify (
    ru_string             varchar2
  )
  return varchar2;

  /** Replace all occurrences of the "?" sign with a letter a-z.
  * @author Morten Egan
  * @return varchar2 The string with the replaced characters.
  */
  function ru_charify (
    ru_string             varchar2
    , ru_upper            boolean default false
  )
  return varchar2;

  /** Replace the "#" character with number and replace the "?" character with a letter.
  * @author Morten Egan
  * @return varchar2 The replaced string.
  */
  function ru_numcharfy (
    ru_string             varchar2
    , ru_upper            boolean default false
  )
  return varchar2;

  /** Replace date format models in a single character string mixed with words.
  * @author Morten Egan
  * @return varchar2 The replaced string.
  */
  function ru_datify (
    ru_string             varchar2
    , ru_date             date        default null
  )
  return varchar2;

  /** Format a single long string of characters into a special format. For instance 1234 into 1-2-3-4
  * @author Morten Egan
  * @return varchar2 The formatted string.
  */
  function ru_display_format (
    ru_string             varchar2
    , ru_format           varchar2
    , ru_add_missing      boolean     default true
  )
  return varchar2;

  /** Extract a random element from a list, where elements can be assigned a percentage weight as well.
  * @author Morten Egan
  * @return varchar2 The element value randomly selected based on a percentage weight.
  */
  function ru_pickone_weighted (
    ru_elements           varchar2
    , ru_seperator        varchar2    default ','
  )
  return varchar2;

  /** Calculate the correct MOD-97 IBAN checksum digits for an IBAN account number.
  * @author Morten Egan
  * @return varchar2 The full IBAN account number with correct checksum numbers.
  */
  function iban_checksum (
    ru_iban               varchar2
    , ru_country          varchar2
  )
  return varchar2;

  /** Generate a permuted version of a string.
  * @author Morten Egan
  * @return varchar2 The permuted version of the string.
  */
  function ru_permute (
    ru_string             varchar2
  )
  return varchar2;

  /** Generate a scrambled version of the string.
  * @author Morten Egan
  * @return varchar2 Scrambled version of the string.
  */
  function ru_scramble (
    ru_string             varchar2
  )
  return varchar2;

  /** Generate an obfuscated version of the string.
  * @author Morten Egan
  * @return varchar2 An obfuscated version of the string.
  */
  function ru_obfuscate (
    ru_string             varchar2
  )
  return varchar2;

  /** Calculate when sunrise or sunset is, on a specific date.
  * @author Morten Egan
  * @return date The date including time that sunrise-sunset is on a specific day.
  */
  function ru_suntime (
    ru_date               date              default sysdate
    , ru_suntype          varchar2          default 'sunrise'
  )
  return date;

  /** Increment a given number with a random increment.
  * @author Morten Egan
  * @return number The incremented number.
  */
  function ru_number_increment (
    ru_increment_from     number            default 1
    , ru_min_increment    number            default 1
    , ru_max_increment    number            default 42
  )
  return number;

  /** Increment a given date with a random increment.
  * @author Morten Egan
  * @return date The incremented date.
  */
  function ru_date_increment (
    ru_increment_from     date              default sysdate
    , ru_increment_name   varchar2          default 'seconds'
    , ru_min_increment    number            default 1
    , ru_max_increment    number            default 59
  )
  return date;

  /** Pick a random column value from a table
  * @author Morten Egan
  * @return varchar2 The value of the column.
  */
  function ru_random_row (
    ru_table              varchar2
    , ru_column           varchar2
    , ru_where_clause     varchar2          default null
  )
  return varchar2;

  /** Function to calculate the check digit in an Country code + NSIN part of an ISIN number.
  * @author Morten Egan
  * @return varchar2 The full isin number including the check digit.
  */
  function ru_isin_checkdigit (
    r_country             varchar2
    , r_nsin              varchar2
  )
  return number;

  /** Calculate the check digit for a CASRN compound registry number.
  * @author Morten Egan
  * @return number The check digit to add.
  */
  function ru_casrn_checkdigit (
    r_casrn_no_chk        varchar2
  )
  return number;

end util_random;
/
