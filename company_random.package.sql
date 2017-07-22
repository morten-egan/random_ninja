create or replace package company_random

as

  /** Generate random company related data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  /** Generate a random company name.
  * @author Morten Egan
  * @return varchar2 The company name generated.
  */
  function r_companyname (
    r_country         varchar2        default null
  )
  return varchar2;

  /** Generate a random job industry.
  * @author Morten Egan
  * @return varchar2 The industry generated.
  */
  function r_industry (
    r_country         varchar2        default null
  )
  return varchar2;

  /** Generate a random tax id/Company registration id.
  * @author Morten Egan
  * @return varchar2 The generated id.
  */
  function r_companyid (
    r_country         varchar2        default null
    , r_formatted     boolean         default true
  )
  return varchar2;

  /** Generate a random count of employees in a company.
  * @author Morten Egan
  * @return number The number of employees.
  */
  function r_employees (
    r_companysize     varchar2        default null
  )
  return number;

  /** Generate a random revenue number.
  * @author Morten Egan
  * @return number The random generated revenue.
  */
  function r_revenue (
    r_companysize     varchar2        default null
  )
  return number;

end company_random;
/
