create or replace package body medical_random

as

  function r_icd10
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_icd10');

    l_ret_var := util_random.ru_replace_ranges('[A-T][01-99].[0-4]');

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_icd10;

begin

  dbms_application_info.set_client_info('medical_random');
  dbms_session.set_identifier('medical_random');

end medical_random;
/
