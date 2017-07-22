create or replace package computer_data

as

  /** Data for random computer data generation.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  type computertypes_rec is record (
    c_category         varchar2(100)
    , c_types          varchar2(4000)
  );
  type computertypes_list is table of computertypes_rec;
  filetypes     computertypes_list;
  mountpoints   computertypes_list;
  mimetypes     computertypes_list;
  errors        computertypes_list;

  g_computer_environments         varchar2(4000) := 'dev,tst,stg,prd';
  g_computer_functions            varchar2(4000) := 'app,db,sql,ftp,mta,dns,cfg,mon,prx,ssh,web';

  type useragent_list is table of varchar2(4000);
  useragents    useragent_list;

end computer_data;
/
