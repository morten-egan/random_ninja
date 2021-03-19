create or replace package science_random

as

  /** Generate science related random data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  /** Generate a random chemical element.
  * @author Morten Egan
  * @return varchar2 The element.
  */
  function r_chemicalelement (
    r_shortform       boolean         default false
  )
  return varchar2;

  /** Generate a random NGC galaxy designation.
  * @author Morten Egan
  * @return varchar2 The galaxy name.
  */
  function r_ngcgalaxy
  return varchar2;

  /** Generate a random GSC2 Star id
  * @author Morten Egan
  * @return varchar2 The GSC2 star id.
  */
  function r_gsc2id
  return varchar2;

  /** Return a planet in the solar system.
  * @author Morten Egan
  * @return varchar2 The planet.
  */
  function r_planet
  return varchar2;

  /** Generate a random valid CASRN (Chemical Abstract Service Registry Number)
  * @author Morten Egan
  * @return varchar2 The valid CASRN number.
  */
  function r_casrn
  return varchar2;

  /** Return scale of size, distance, model or diagram.
  * @author Morten Egan
  * @return varchar2 The scale.
  */
  function r_scale
  return varchar2;

  function r_tree (
    r_scientific      boolean         default false
  )
  return varchar2;

end science_random;
/
