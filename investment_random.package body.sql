create or replace package body investment_random

as

  function r_swift_id (
    r_swift_category              varchar2 default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_swift_category        varchar2(100);
    l_swift_cat_index       number;

  begin

    dbms_application_info.set_action('r_swift_id');

    if l_swift_category is null then
      l_swift_cat_index := core_random.r_natural(1, investment_data.g_swift_messages.count);
    end if;

    l_ret_var := investment_data.g_swift_messages(l_swift_cat_index).swift_messages(core_random.r_natural(1, investment_data.g_swift_messages(l_swift_cat_index).swift_messages.count)).swift_id;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_swift_id;

  function r_fundname
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_fundname');

    l_ret_var := company_random.r_companyname || ' ' || util_random.ru_pickone(investment_data.g_fund_adjectives) || ' Fund';

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_fundname;

begin

  dbms_application_info.set_client_info('investment_random');
  dbms_session.set_identifier('investment_random');

end investment_random;
/
