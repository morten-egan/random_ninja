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
    , r_w_min           number        default null
    , r_w_max           number        default null
    , r_weight          number        default null
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_amount');

    l_ret_var := core_random.r_float(r_precision, r_min, r_max, r_w_min, r_w_max, r_weight);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_amount;

  function r_accountnumber (
    r_country           varchar2      default null
    , r_iban            boolean       default true
  )
  return varchar2

  as

    l_ret_var               varchar2(250);
    l_country               varchar2(10) := r_country;

  begin

    dbms_application_info.set_action('r_accountnumber');

    if length(l_country) = 2 then
      l_country := upper(l_country);
    end if;

    if l_country is null or length(l_country) > 2 then
      if r_iban then
        l_country := util_random.ru_pickone(finance_data.g_iban_enabled);
      end if;
    elsif l_country is not null and r_iban then
      if not util_random.ru_inlist(finance_data.g_iban_enabled, l_country) then
        l_country := util_random.ru_pickone(finance_data.g_iban_enabled);
      end if;
    end if;

    -- Now we have the country, let us get the basic format string.
    -- Add the IBAN specifics if needed.
    l_ret_var := finance_data.country_bankaccounts(l_country).bban_format;
    if r_iban then
      l_ret_var := '**kk' || l_ret_var;
    end if;
    -- Run the randomizer for the specified format string.
    -- When creating the IBAN from the format. The format codes are the following:
    -- ** = Country Code
    -- kk = IBAN Check digits.
    -- n = Numeric character. (0-9)
    -- a = Upper case alpha character. (A-Z)
    -- c = Mixed alpha numeric (0-9)(A-Z)(a-z)
    if r_iban then
      l_ret_var := replace(replace(l_ret_var, '**', l_country), 'kk', '00');
    end if;
    l_ret_var := util_random.ru_replace(l_ret_var, 'n');
    l_ret_var := util_random.ru_replace(l_ret_var, 'a', 'core_random.r_character(''ABCDEFGHIJKLMNOPQRSTUVWXYZ'')');
    l_ret_var := util_random.ru_replace(l_ret_var, 'c', 'core_random.r_character(''ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'')');
    if r_iban then
      l_ret_var := util_random.iban_checksum(l_ret_var, l_country);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_accountnumber;

  function r_accounttype
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_accounttype');

    while l_ret_var is null loop
      l_ret_var := finance_data.account_types(core_random.r_natural(1, finance_data.account_types.count)).type_name;
    end loop;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_accounttype;

  function r_accounttransaction (
    r_accounttype       varchar2      default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_accounttype           varchar2(100) := r_accounttransaction.r_accounttype;

  begin

    dbms_application_info.set_action('r_accounttransaction');

    if l_accounttype is not null then
      for i in 1..finance_data.account_types.count loop
        if finance_data.account_types(i).type_name = l_accounttype then
          l_ret_var := util_random.ru_pickone(finance_data.account_types(i).transaction_types);
        end if;
      end loop;
      if l_ret_var is null then
        l_ret_var := util_random.ru_pickone(finance_data.account_types(core_random.r_natural(1, finance_data.account_types.count)).transaction_types);
      end if;
    else
      l_ret_var := util_random.ru_pickone(finance_data.account_types(core_random.r_natural(1, finance_data.account_types.count)).transaction_types);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_accounttransaction;

  function r_accountbalance (
    r_accounttype       varchar2      default null
  )
  return number

  as

    l_ret_var               number;
    l_accounttype           varchar2(100) := r_accountbalance.r_accounttype;
    l_w_min                 number;
    l_w_max                 number;
    l_rand_account_idx      number;

  begin

    dbms_application_info.set_action('r_accountbalance');

    if l_accounttype is not null then
      for i in 1..finance_data.account_types.count loop
        if finance_data.account_types(i).type_name = l_accounttype then
          l_w_min := finance_data.account_types(i).average_balance * 0.8;
          l_w_max := finance_data.account_types(i).average_balance * 1.4;
        end if;
      end loop;
    end if;

    if l_w_min is null then
      -- No account type set. Go random.
      l_rand_account_idx := core_random.r_natural(1, finance_data.account_types.count);
      l_w_min := finance_data.account_types(l_rand_account_idx).average_balance * 0.8;
      l_w_max := finance_data.account_types(l_rand_account_idx).average_balance * 1.4;
    end if;

    l_ret_var := core_random.r_float(2, 100, 500000, l_w_min, l_w_max);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_accountbalance;

  function r_bitcoin (
    r_p2sh              boolean      default true
  )
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_bitcoin');

    l_ret_var := core_random.r_string(core_random.r_natural(25,33), finance_data.g_bitcoin_pool);
    if r_p2sh then
      l_ret_var := '3' || l_ret_var;
    else
      l_ret_var := '1' || l_ret_var;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_bitcoin;

  function r_exchange (
    r_shortform         boolean       default true
  )
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_exchange');

    if r_shortform then
      l_ret_var := finance_data.exchanges(core_random.r_natural(1, finance_data.exchanges.count)).exchange_id;
    else
      l_ret_var := finance_data.exchanges(core_random.r_natural(1, finance_data.exchanges.count)).exchange_name;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_exchange;

  function r_creditcard_tx_type
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_creditcard_tx_type');

    l_ret_var := util_random.ru_pickone_weighted(finance_data_account.g_w_creditcard_tx_type);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_creditcard_tx_type;

  function r_cryptocurrency (
    r_shortform       boolean         default true
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_pick                  number;

  begin

    dbms_application_info.set_action('r_cryptocurrency');

    l_pick := core_random.r_natural(1, finance_data.cryptos.count);

    if r_shortform then
      l_ret_var := finance_data.cryptos(l_pick).symbol;
    else
      l_ret_var := finance_data.cryptos(l_pick).crypto_name;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_cryptocurrency;

begin

  dbms_application_info.set_client_info('finance_random');
  dbms_session.set_identifier('finance_random');

end finance_random;
/
