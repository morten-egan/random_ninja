create or replace package science_data

as

  /** Supporting data structures to create random science data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  type natural_element_rec is record (
    full_name         varchar2(50)
    , short_name      varchar2(50)
  );
  type natural_element_tab is table of natural_element_rec;
  g_natural_elements        natural_element_tab;

  g_planets               varchar2(500) := 'Mercury,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune';

  g_used_models_scales    varchar2(500) := '1,2,3,4,5,6,7,8,9,10,12,14,16,17,18,20,24,34,36,40,43,48,50,64,87,148,285,288,432,600,700,1250,2400,3900,4800';
  g_used_map_scales       varchar2(500) := '5,10,100,500,1000,10000,100000,1M,2M,5M,20M,50M,100M';

end science_data;
/
