create or replace package location_data

as

  /** Provide seed data for randomizing country data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  type continent is record (
    continent_name        varchar2(150)
    , size_square_km      number
    , avg_floor_space     number
    , avg_house_rooms     number
  );
  type continent_list is table of continent;
  continents  continent_list;

  -- For the random country selection.
  type country is record (
    country_name          varchar2(4000)
    , country_short       varchar2(10)
  );
  type country_list is table of country;
  countries   country_list;

  type state_data is record (
    state_name            varchar2(250)
    , state_short         varchar2(20)
    , state_capital       varchar2(250)
    , cities              varchar2(32000)
  );
  type state_list is table of state_data;
  type country_states is table of state_list index by varchar2(20);
  states      country_states;

  type road_rec is record (
    road_name_full        varchar2(250)
    , road_name_short     varchar2(50)
    , road_name_ext       varchar2(1)
  );
  type road_list is table of road_rec;
  type road_array is table of road_list index by varchar2(20);
  road_endings  road_array;

  type address2_list is table of varchar2(50);
  type address2_tab is table of address2_list index by varchar2(10);
  second_addresses    address2_tab;

  init_data   varchar2(250);

end location_data;
/
