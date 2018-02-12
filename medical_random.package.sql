create or replace package medical_random

as

  /** Random data generator in the medical domain.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  /** Generate a random ICD10 code.
  * @author Morten Egan
  * @return varchar2 The ICD10 code generated.
  */
  function r_icd10
  return varchar2;

end medical_random;
/
