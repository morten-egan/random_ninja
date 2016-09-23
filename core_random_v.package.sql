create or replace package core_random_v

as

  /** Core variables used throughout the project.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  -- Symbols used for random characters.
  g_symbols_pool      varchar2(4000) := '!@#$%^&*()[]';

  -- Globals for language sensitive functions if no language specified.
  g_vowels            varchar2(50) := 'aeiou';
  g_easy_consonants   varchar2(50) := 'bcdfghjklmnprstvwz';

end core_random_v;
/
