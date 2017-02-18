create or replace package transport_data

as

  /** Data to help generate random transport related data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.1.0';

  type registration_format_tab is table of varchar2(50) index by varchar2(10);
  icao_aircraft_prefix      registration_format_tab;
  car_registration_formats  registration_format_tab;

end transport_data;
/
