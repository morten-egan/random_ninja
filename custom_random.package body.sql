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

    /* Time random */
    l_ret_var := replace(l_ret_var, '{{second}}', time_random.r_second);
    l_ret_var := replace(l_ret_var, '{{minute}}', time_random.r_minute);
    l_ret_var := replace(l_ret_var, '{{hour}}', time_random.r_hour);
    l_ret_var := replace(l_ret_var, '{{day}}', time_random.r_day);
    l_ret_var := replace(l_ret_var, '{{month}}', time_random.r_month);
    l_ret_var := replace(l_ret_var, '{{year}}', time_random.r_year);
    l_ret_var := replace(l_ret_var, '{{date}}', to_char(time_random.r_date));
    l_ret_var := replace(l_ret_var, '{{timestamp}}', to_char(time_random.r_timestamp));
    l_ret_var := replace(l_ret_var, '{{ampm}}', time_random.r_ampm);
    l_ret_var := replace(l_ret_var, '{{millisecond}}', time_random.r_millisecond);
    l_ret_var := replace(l_ret_var, '{{epoch}}', time_random.r_epoch);

    /* Company random */
    l_ret_var := replace(l_ret_var, '{{companyname}}', company_random.r_companyname);
    l_ret_var := replace(l_ret_var, '{{industry}}', company_random.r_industry);
    l_ret_var := replace(l_ret_var, '{{companyid}}', company_random.r_companyid);
    l_ret_var := replace(l_ret_var, '{{employees}}', company_random.r_employees);
    l_ret_var := replace(l_ret_var, '{{revenue}}', company_random.r_revenue);

    /* Computer random */
    l_ret_var := replace(l_ret_var, '{{osflavor}}', computer_random.r_os_flavor);
    l_ret_var := replace(l_ret_var, '{{mountpoint}}', computer_random.r_mountpoint);
    l_ret_var := replace(l_ret_var, '{{fileextention}}', computer_random.r_extension);
    l_ret_var := replace(l_ret_var, '{{filename}}', computer_random.r_filename);
    l_ret_var := replace(l_ret_var, '{{path}}', computer_random.r_path);
    l_ret_var := replace(l_ret_var, '{{semver}}', computer_random.r_semver);
    l_ret_var := replace(l_ret_var, '{{mimetype}}', computer_random.r_mimetype);
    l_ret_var := replace(l_ret_var, '{{servername}}', computer_random.r_servername);
    l_ret_var := replace(l_ret_var, '{{useragent}}', computer_random.r_useragent);
    l_ret_var := replace(l_ret_var, '{{error}}', computer_random.r_error);

    /* Consumer random */
    l_ret_var := replace(l_ret_var, '{{goodscategory}}', consumer_random.r_category);
    l_ret_var := replace(l_ret_var, '{{fooditem}}', consumer_random.r_food_item);
    l_ret_var := replace(l_ret_var, '{{nonfooditem}}', consumer_random.r_nonfood_item);
    l_ret_var := replace(l_ret_var, '{{serviceitem}}', consumer_random.r_service_item);
    l_ret_var := replace(l_ret_var, '{{additive}}', consumer_random.r_additive);

    /* Finance random */
    l_ret_var := replace(l_ret_var, '{{currency}}', finance_random.r_currency);
    l_ret_var := replace(l_ret_var, '{{currencypair}}', finance_random.r_currencypair);
    l_ret_var := replace(l_ret_var, '{{creditcardprovider}}', finance_random.r_creditcard);
    l_ret_var := replace(l_ret_var, '{{creditcardnumber}}', finance_random.r_creditcardnum);
    l_ret_var := replace(l_ret_var, '{{creditcardexpiry}}', finance_random.r_expirydate);
    l_ret_var := replace(l_ret_var, '{{amount}}', finance_random.r_amount);
    l_ret_var := replace(l_ret_var, '{{bankaccountnumber}}', finance_random.r_accountnumber);
    l_ret_var := replace(l_ret_var, '{{bankaccounttype}}', finance_random.r_accounttype);
    l_ret_var := replace(l_ret_var, '{{bankaccounttransaction}}', finance_random.r_accounttransaction);
    l_ret_var := replace(l_ret_var, '{{bankaccountbalance}}', finance_random.r_accountbalance);
    l_ret_var := replace(l_ret_var, '{{bitcoinaddress}}', finance_random.r_bitcoin);
    l_ret_var := replace(l_ret_var, '{{exchange}}', finance_random.r_exchange);
    l_ret_var := replace(l_ret_var, '{{creditcardtransactiontype}}', finance_random.r_creditcard_tx_type);

    /* Games random */
    l_ret_var := replace(l_ret_var, '{{diceroll}}', games_random.r_diceroll);
    l_ret_var := replace(l_ret_var, '{{cointoss}}', games_random.r_cointoss);
    l_ret_var := replace(l_ret_var, '{{cardsuit}}', games_random.r_cardsuit);
    l_ret_var := replace(l_ret_var, '{{card}}', games_random.r_card);

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
