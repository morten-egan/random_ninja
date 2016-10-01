create or replace package core_random_v

as

  /** Core variables used throughout the project.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  -- Symbols used for random characters.
  g_symbols_pool                  varchar2(4000) := '!@#$%^&*()[]';

  -- Globals for language sensitive functions if no language specified.
  g_vowels                        varchar2(50) := 'aeiou';
  g_easy_consonants               varchar2(50) := 'bcdfghjklmnprstvwz';

  -- Languages implemented. Remember to update this in case a new country is added.
  g_name_countries_implemented    varchar2(4000) := ('US');

  -- Height globals.
  g_highest_point                 number := 8152;
  g_highest_livable_point         number := 4870;

  -- Depth globals.
  g_lowest_point_land             number := -418;
  g_lowest_point_underground      number := -2191;
  g_lowest_point_ocean            number := -11034;

end core_random_v;
/
