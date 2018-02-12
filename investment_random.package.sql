create or replace package investment_random

as

  /** Random data generators for investment data domain.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  /** Generate a swift type.
  * @author Morten Egan
  * @return varchar2 The swift message generated.
  */
  function r_swift_id (
    r_swift_category              varchar2 default null
  )
  return varchar2;

  /** Generate a fund name
  * @author Morten Egan
  * @return varchar2 The name of the fund.
  */
  function r_fundname
  return varchar2;

  /** Generate an ISIN code.
  * @author Morten Egan
  * @return varchar2 The isin code.
  */
  function r_isin (
    r_country                     varchar2 default null
  )
  return varchar2;

  /** Generate a wealth product.
  * @author Morten Egan
  * @return varchar2 The wealth product.
  */
  function r_wealthproduct
  return varchar2;

  /** Generate an interest rate.
  * @author Morten Egan
  * @return number The interest rate. Weighted 80% to return between 0.050 and 0.005 and min, max span between 0.002 and 0.1
  */
  function r_interestrate
  return number;

  /** Generate a risk rating.
  * @author Morten Egan
  * @return number The risk rating. Default 1-6
  */
  function r_riskrating (
    r_risk_min                  number default 1
    , r_risk_max                number default 6
  )
  return number;

  /** Generat a bond rating.
  * @author Morten Egan
  * @return varchar2 The rating of the bond.
  */
  function r_bondrating
  return varchar2;

end investment_random;
/
