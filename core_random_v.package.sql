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

  -- Height globals.
  g_highest_point                 number := 8152;
  g_highest_livable_point         number := 4870;

  -- Depth globals.
  g_lowest_point_land             number := -418;
  g_lowest_point_underground      number := -2191;
  g_lowest_point_ocean            number := -11034;

  -- tld list
  g_tld_list                      varchar2(32000) := '.com,.net,.org,.co.uk,.dk,.it,.io,.gov,.sg,.com.sg,.mil';

  -- Local implmentation variables.
  -- Person name languages implemented. Remember to update this in case a new country is added.
  g_name_countries_implemented    varchar2(4000) := ('US');
  -- Identification number countries implemented.
  g_id_countries_implemented      varchar2(4000) := ('US');
  -- State data countries implemented
  g_state_countries_implemented   varchar2(4000) := ('US');
  -- Road names implemented
  g_road_countries_implemented    varchar2(4000) := ('US');

end core_random_v;
/
