create or replace package games_data

as

  /** Data related to games_random functions.
  * @author Morten Egan
  * @version 1.3.0
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  type monopoly_tab is table of varchar2(4000) index by varchar2(100);
  g_monopoly_streets  monopoly_tab;
  g_monopoly_colors   varchar2(4000) := 'Purple,Blue,Pink,Orange,Red,Yellow,Green,Blue,Railroads,Utilities';

end games_data;
/
