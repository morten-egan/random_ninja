create or replace package body games_data

as

begin

  dbms_application_info.set_client_info('games_data');
  dbms_session.set_identifier('games_data');
  
  g_monopoly_streets('Purple') := 'Mediterranean Avenue,Baltic Avenue';
  g_monopoly_streets('Blue') := 'Oriental Avenue,Vermont Avenue,Connecticut Avenue';
  g_monopoly_streets('Pink') := 'St. Charles Place,States Avenue,Virginia Avenue';
  g_monopoly_streets('Orange') := 'St James Place,Tennessee Avenue,New York Avenue';
  g_monopoly_streets('Red') := 'Kentucky Avenue,Indiana Avenue,Illinois Avenue';
  g_monopoly_streets('Yellow') := 'Atlantic Avenue,Ventnor Avenue,Marvin Gardens';
  g_monopoly_streets('Green') := 'Pacific Avenue,No. Carolina Avenue,	Pennsylvania Avenue';
  g_monopoly_streets('Blue') := 'Park Place,Broadwalk';
  g_monopoly_streets('Railroads') := 'Reading Railroad,Pennsylvania Railroad,B&0 Railroad,Short line Railroad';
  g_monopoly_streets('Utilities') := 'Electric Company,Water works';

end games_data;
/
