create or replace package games_random

as

  /** Random functions related to gaming.
  * @author Morten Egan
  * @version 1.3.0
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  /** Generate a dice roll.
  * @author Morten Egan
  * @return number The value of the dice roll.
  */
  function r_diceroll (
    r_dicesides           number      default 6
  )
  return number;

  /** Generate a coin toss.
  * @author Morten Egan
  * @return varchar2 The side of the coin.
  */
  function r_cointoss
  return varchar2;

  /** Generate a card deck suit.
  * @author Morten Egan
  * @return varchar2 The suit picked.
  */
  function r_cardsuit
  return varchar2;

  /** Generate card.
  * @author Morten Egan
  * @return varchar2 The card returned.
  */
  function r_card (
    r_cardsuit            varchar2    default null
  )
  return varchar2;

end games_random;
/
