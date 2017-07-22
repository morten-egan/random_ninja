create or replace package finance_data

as

  /** Data for generation of random financial data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  init_data   varchar2(250);

  -- Currency datatypes
  type currency_data is record (
    iso_currency          varchar2(5)
    , currency_name       varchar2(250)
  );
  type currency_list is table of currency_data;
  currencies  currency_list;

  -- Credit Card datatypes
  type creditcard_data is record (
    cc_name               varchar2(255)
    , cc_shortname        varchar2(50)
    , cc_prefix           number
    , cc_length           number
  );
  type creditcard_list is table of creditcard_data;
  creditcards  creditcard_list;

  type account_type_rec is record (
    type_name             varchar2(50)
    , transaction_types   varchar2(4000)
    , average_balance     number
  );
  type account_type_list is table of account_type_rec;
  account_types   account_type_list;

  type bankaccount_rec is record (
    iban_length           number
    , bban_format         varchar2(50)
    , bban_min            number
    , bban_max            number
  );
  type bankaccount_list is table of bankaccount_rec index by varchar2(10);
  country_bankaccounts  bankaccount_list;

  type exchange_rec is record (
    exchange_name         varchar2(150)
    , exchange_id         varchar2(10)
    , timezone            varchar2(150)
  );
  type exchange_list is table of exchange_rec;
  exchanges     exchange_list;

  -- IBAN Enabled countries.
  g_iban_enabled          varchar2(4000) := 'AL,AD,AT,AZ,BH,BE,BA,BR,BG,CR,HR,CY,CZ,DK,DO,TL,EE,FO,FI,FR,GE,DE,GI,GR,GL,GT,HU,IS,IE,IL,IT';

  -- Bitcoin character pool.
  g_bitcoin_pool          varchar2(250) := 'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz123456789';

end finance_data;
/
