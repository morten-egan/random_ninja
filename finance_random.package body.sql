create or replace package body finance_random

as

  function r_currency (
    r_shortform       boolean         default true
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_pick                  number;

  begin

    dbms_application_info.set_action('r_currency');

    l_pick := core_random.r_natural(1, finance_data.currencies.count);

    if r_shortform then
      l_ret_var := finance_data.currencies(l_pick).iso_currency;
    else
      l_ret_var := finance_data.currencies(l_pick).currency_name;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_currency;

  function r_currencypair (
    r_base_currency     varchar2        default null
    , r_quote_currency  varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_base_currency         varchar2(5) := r_base_currency;
    l_quote_currency        varchar2(5) := r_quote_currency;
    l_base_pick             number;
    l_quote_pick            number;

  begin

    dbms_application_info.set_action('r_currencypair');

    if l_base_currency is null then
      l_base_pick := core_random.r_natural(1, finance_data.currencies.count);
      l_base_currency := finance_data.currencies(l_base_pick).iso_currency;
    else
      for i in 1..finance_data.currencies.count loop
        if finance_data.currencies(i).iso_currency = l_base_currency then
          l_base_pick := i;
          exit;
        end if;
      end loop;
      if l_base_pick is null then
        -- Something failed lets make sure we have one.
        l_base_pick := core_random.r_natural(1, finance_data.currencies.count);
        l_base_currency := finance_data.currencies(l_base_pick).iso_currency;
      end if;
    end if;

    if l_quote_currency is null then
      l_quote_pick := core_random.r_natural(1, finance_data.currencies.count);
      while l_quote_pick = l_base_pick loop
        l_quote_pick := core_random.r_natural(1, finance_data.currencies.count);
      end loop;
      l_quote_currency := finance_data.currencies(l_quote_pick).iso_currency;
    end if;

    l_ret_var := l_base_currency || '/' || l_quote_currency;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_currencypair;

  function r_creditcard (
    r_shortform         boolean         default true
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_pick                  number;

  begin

    dbms_application_info.set_action('r_creditcard');

    l_pick := core_random.r_natural(1, finance_data.creditcards.count);

    if r_shortform then
      l_ret_var := finance_data.creditcards(l_pick).cc_shortname;
    else
      l_ret_var := finance_data.creditcards(l_pick).cc_name;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_creditcard;

  function r_creditcardnum (
    r_creditcard        varchar2        default null
  )
  return number

  as

    l_ret_var               number;
    l_pick                  number;
    l_generated             number;
    l_creditcard            varchar2(255) := r_creditcardnum.r_creditcard;

  begin

    dbms_application_info.set_action('r_creditcardnum');

    if l_creditcard is null then
      l_pick := core_random.r_natural(1, finance_data.creditcards.count);
    else
      for i in 1..finance_data.creditcards.count loop
        if l_creditcard = finance_data.creditcards(i).cc_name or l_creditcard = finance_data.creditcards(i).cc_shortname then
          l_pick := i;
        end if;
      end loop;
      if l_pick is null then
        l_pick := core_random.r_natural(1, finance_data.creditcards.count);
      end if;
    end if;

    l_generated := finance_data.creditcards(l_pick).cc_prefix || core_random.r_string((finance_data.creditcards(l_pick).cc_length - 1) - length(finance_data.creditcards(l_pick).cc_prefix), '0123456789');
    l_ret_var := l_generated || util_random.luhn_calculate(l_generated);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_creditcardnum;

  function r_expirydate (
    r_future            boolean         default true
  )
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_expirydate');

    if r_future then
      l_ret_var := lpad(core_random.r_natural(to_number(to_char(sysdate,'MM')), 12),2,'0') || '/' || time_random.r_year(to_number(to_char(sysdate,'YYYY')), to_number(to_char(sysdate,'YYYY')) + 3);
    else
      l_ret_var := lpad(time_random.r_month,2,'0') || '/' || time_random.r_year;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_expirydate;

  function r_amount (
    r_min               number        default 0
    , r_max             number        default 10000
    , r_precision       number        default 2
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_amount');

    l_ret_var := core_random.r_float(r_precision, r_min, r_max);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_amount;

begin

  dbms_application_info.set_client_info('finance_random');
  dbms_session.set_identifier('finance_random');

end finance_random;
/
