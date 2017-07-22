create or replace package finance_random

as

  /** Random financial data generation.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version           varchar2(250) := '1.3.0';

  /** Return a random currency.
  * @author Morten Egan
  * @return varchar2 The currency randomly generated. By default it is the ISO code for the currency.
  */
  function r_currency (
    r_shortform         boolean         default true
  )
  return varchar2;

  /** Generate a curency pair.
  * @author Morten Egan
  * @return varchar2 The currency pair.
  */
  function r_currencypair (
    r_base_currency     varchar2        default null
    , r_quote_currency  varchar2        default null
  )
  return varchar2;

  /** Generate a random credit card type.
  * @author Morten Egan
  * @return varchar2 The credit card generated.
  */
  function r_creditcard (
    r_shortform         boolean         default true
  )
  return varchar2;

  /** Generate a random credit card number. Keeping in line with Luhn algorithm.
  * @author Morten Egan
  * @return number The generated credit card number.
  */
  function r_creditcardnum (
    r_creditcard        varchar2        default null
  )
  return number;

  /** Generate a random expiry date for a credit card.
  * @author Morten Egan
  * @return varchar2 The expiry generated in the form of MM/YYYY.
  */
  function r_expirydate (
    r_future            boolean         default true
  )
  return varchar2;

  /** Generate a random amount
  * @author Morten Egan
  * @return number The amount generated. Default is from 0 to 10000. specify differently if needed.
  */
  function r_amount (
    r_min               number        default 0
    , r_max             number        default 10000
    , r_precision       number        default 2
  )
  return number;

  /** Generate a bank account number.
  * @author Morten Egan
  * @return varchar2 The bank account number generated.
  */
  function r_accountnumber (
    r_country           varchar2      default null
    , r_iban            boolean       default true
  )
  return varchar2;

  /** Generate an bank account type.
  * @author Morten Egan
  * @return varchar2 The generated bank account type name.
  */
  function r_accounttype
  return varchar2;

  /** Generate a transaction for bank account.
  * @author Morten Egan
  * @return varchar2 The generated transaction type.
  */
  function r_accounttransaction (
    r_accounttype       varchar2      default null
  )
  return varchar2;

  /** Generate a random account balance.
  * @author Morten Egan
  * @return number The balance of the account.
  */
  function r_accountbalance (
    r_accounttype       varchar2      default null
  )
  return number;

  /** Generate a bitcoin address.
  * @author Morten Egan
  * @return varchar2 The bitcoin address generated.
  */
  function r_bitcoin (
    r_p2sh              boolean       default true
  )
  return varchar2;

  /** Generate a random exchange.
  * @author Morten Egan
  * @return varchar2 The exchange generated.
  */
  function r_exchange (
    r_shortform         boolean       default true
  )
  return varchar2;

  /** Generate a random creditcard transaction type.
  * @author Morten Egan
  * @return varchar2 The transaction type generated.
  */
  function r_creditcard_tx_type
  return varchar2;

end finance_random;
/
