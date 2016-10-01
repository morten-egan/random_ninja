create or replace package location_data

as

  /** Provide seed data for randomizing country data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  -- For the random country selection.
  type country is record (
    country_name          varchar2(4000)
    , country_short       varchar2(10)
  );

  type country_list is table of country;

  countries   country_list;

end location_data;
/
