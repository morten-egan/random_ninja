create or replace package body games_random

as

  function r_diceroll (
    r_dicesides           number      default 6
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_diceroll');

    l_ret_var := core_random.r_natural(1, r_dicesides);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_diceroll;

  function r_cointoss
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_cointoss');

    if core_random.r_bool then
      l_ret_var := 'heads';
    else
      l_ret_var := 'tails';
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_cointoss;

  function r_cardsuit
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_percent               number;

  begin

    dbms_application_info.set_action('r_cardsuit');

    l_percent := core_random.r_natural(1,100);

    if l_percent between 1 and 25 then
      l_ret_var := 'hearts';
    elsif l_percent between 26 and 50 then
      l_ret_var := 'diamonds';
    elsif l_percent between 51 and 75 then
      l_ret_var := 'clubs';
    else
      l_ret_var := 'spades';
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_cardsuit;

  function r_card (
    r_cardsuit            varchar2    default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_suit                  varchar2(100) := r_card.r_cardsuit;
    l_cardnumber            number;

  begin

    dbms_application_info.set_action('r_card');

    if l_suit is null then
      l_suit := games_random.r_cardsuit;
    end if;

    l_cardnumber := core_random.r_natural(1,13);

    if l_cardnumber = 1 then
      l_ret_var := l_cardnumber || ' of ' || l_suit;
    elsif l_cardnumber = 11 then
      l_ret_var := 'Jack of ' || l_suit;
    elsif l_cardnumber = 12 then
      l_ret_var := 'Queen of ' || l_suit;
    elsif l_cardnumber = 13 then
      l_ret_var := 'King of ' || l_suit;
    else
      l_ret_var := l_cardnumber || ' of ' || l_suit;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_card;

begin

  dbms_application_info.set_client_info('games_random');
  dbms_session.set_identifier('games_random');

end games_random;
/
