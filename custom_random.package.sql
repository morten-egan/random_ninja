create or replace package custom_random

as

  /** Customized freeform random data package.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  /** Function to replace freeform text containing keywords, with random.
  * @author Morten Egan
  * @return varchar2 The text with keywords replaced with random data.
  */
  function r_freeform (
    r_freeform_text         varchar2
  )
  return varchar2;

end custom_random;
/
