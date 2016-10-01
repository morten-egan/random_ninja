create or replace package names_data

as

  /** Provide Name data for the randomizer.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  type name_list is table of varchar2(4000);

  type country_names is record (
    male_first_names            name_list
    , male_middle_names         name_list
    , female_first_names        name_list
    , female_middle_names       name_list
    , last_names                name_list
    , male_prefix               varchar2(4000)
    , female_prefix             varchar2(4000)
    , all_prefix                varchar2(4000)
  );

  type country_name_list is table of country_names index by varchar2(10);

  r_country_names country_name_list;

end names_data;
/
