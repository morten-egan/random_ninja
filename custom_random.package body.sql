create or replace package body custom_random

as

  function r_freeform (
    r_freeform_text         varchar2
  )
  return varchar2

  as

    l_ret_var               varchar2(32000) := r_freeform_text;

  begin

    dbms_application_info.set_action('r_freeform');

    /* Person random */
    l_ret_var := replace(l_ret_var, '{{firstname}}', person_random.r_firstname);
    l_ret_var := replace(l_ret_var, '{{lastname}}', person_random.r_lastname);
    l_ret_var := replace(l_ret_var, '{{name}}', person_random.r_name);
    l_ret_var := replace(l_ret_var, '{{age}}', person_random.r_age);
    l_ret_var := replace(l_ret_var, '{{birthday}}', to_char(person_random.r_birthday));
    l_ret_var := replace(l_ret_var, '{{gender}}', person_random.r_gender);
    l_ret_var := replace(l_ret_var, '{{prefix}}', person_random.r_prefix);
    l_ret_var := replace(l_ret_var, '{{identification}}', person_random.r_identification);
    l_ret_var := replace(l_ret_var, '{{jobsector}}', person_random.r_jobsector);
    l_ret_var := replace(l_ret_var, '{{jobtitle}}', person_random.r_jobtitle);
    l_ret_var := replace(l_ret_var, '{{salary}}', to_char(person_random.r_salary));

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_freeform;

begin

  dbms_application_info.set_client_info('custom_random');
  dbms_session.set_identifier('custom_random');

end custom_random;
/
