create or replace package investment_random

as

  /** Random data generators for investment data domain.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  /** Generate a swift type.
  * @author Morten Egan
  * @return varchar2 The swift message generated.
  */
  function r_swift_id (
    r_swift_category              varchar2 default null
  )
  return varchar2;

end investment_random;
/
