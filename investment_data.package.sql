create or replace package investment_data

as

  /** Metadata information for investment functions.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  type swift_rec is record (
    swift_id            varchar2(50)
    , swift_name        varchar2(4000)
  );

  type swift_tab is table of swift_rec;

  type swift_category_rec is record (
    category_name       varchar2(200)
    , swift_messages    swift_tab
  );

  type swift_category_tab is table of swift_category_rec;

  g_swift_messages          swift_category_tab;

end investment_data;
/
