create or replace package finance_data

as

  /** Data for generation of random financial data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

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

end finance_data;
/
