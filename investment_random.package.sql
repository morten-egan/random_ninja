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

end investment_random;
/
