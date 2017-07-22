create or replace package consumer_random

as

  /** Generate random consumer base data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  /** Create a random goods category.
  * @author Morten Egan
  * @return varchar2 The category returned.
  */
  function r_category (
    r_food_item             boolean         default false
    , r_nonfood_item        boolean         default false
  )
  return varchar2;

  /** Generate a random food item.
  * @author Morten Egan
  * @return varchar2 The food item generated.
  */
  function r_food_item (
    r_category              varchar2        default null
  )
  return varchar2;

  /** Generate a random non-food item.
  * @author Morten Egan
  * @return varchar2 The non-food item generated.
  */
  function r_nonfood_item (
    r_category              varchar2        default null
  )
  return varchar2;

  /** Generate a random service item.
  * @author Morten Egan
  * @return varchar2 The service item generated.
  */
  function r_service_item (
    r_category              varchar2        default null
  )
  return varchar2;

  /** Generate a random food additive.
  * @author Morten Egan
  * @return varchar2 The additive generated.
  */
  function r_additive (
    r_category              varchar2        default null
  )
  return varchar2;

end consumer_random;
/
