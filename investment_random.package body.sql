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

    function r_isin (
      r_country                     varchar2 default null
    )
    return varchar2

    as

      l_ret_var               varchar2(100);

      l_country               varchar2(10) := r_country;
      l_nsin                  varchar2(9) := '#########';
      l_controldigit          number;

    begin

      dbms_application_info.set_action('r_isin');

      if l_country is null or length(l_country) > 2 then
        l_country := location_random.r_country(true);
      end if;

      l_nsin := util_random.ru_numerify(l_nsin);

      l_controldigit := util_random.ru_isin_checkdigit(l_country, l_nsin);

      l_ret_var := upper(l_country) || l_nsin || l_controldigit;

      dbms_application_info.set_action(null);

      return l_ret_var;

      exception
        when others then
          dbms_application_info.set_action(null);
          raise;

    end r_isin;

    function r_wealthproduct
    return varchar2

    as

      l_ret_var               varchar2(100);

    begin

      dbms_application_info.set_action('r_wealthproduct');

      l_ret_var := util_random.ru_pickone(investment_data.g_wealth_products);

      dbms_application_info.set_action(null);

      return l_ret_var;

      exception
        when others then
          dbms_application_info.set_action(null);
          raise;

    end r_wealthproduct;

    function r_interestrate
    return number

    as

      l_ret_var               number;

    begin

      dbms_application_info.set_action('r_interestrate');

      l_ret_var := core_random.r_float(r_fixed => 3, r_min => 0.002, r_max => 0.1, r_w_min => 0.005, r_w_max => 0.050, r_weight => 80);

      dbms_application_info.set_action(null);

      return l_ret_var;

      exception
        when others then
          dbms_application_info.set_action(null);
          raise;

    end r_interestrate;

    function r_riskrating (
      r_risk_min                  number default 1
      , r_risk_max                number default 6
    )
    return number

    as

      l_ret_var               number;

    begin

      dbms_application_info.set_action('r_riskrating');

      l_ret_var := core_random.r_natural(r_risk_min, r_risk_max);

      dbms_application_info.set_action(null);

      return l_ret_var;

      exception
        when others then
          dbms_application_info.set_action(null);
          raise;

    end r_riskrating;

    function r_bondrating
    return varchar2

    as

      l_ret_var               varchar2(100);

    begin

      dbms_application_info.set_action('r_bondrating');

      l_ret_var := util_random.ru_pickone(investment_data.g_bond_ratings);

      dbms_application_info.set_action(null);

      return l_ret_var;

      exception
        when others then
          dbms_application_info.set_action(null);
          raise;

    end r_bondrating;

  begin

    dbms_application_info.set_client_info('investment_random');
    dbms_session.set_identifier('investment_random');

  end investment_random;
  /
