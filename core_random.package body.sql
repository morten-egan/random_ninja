create or replace package body core_random

as

  function r_bool (
    r_likelyhood      number           default 50
  )
  return boolean

  as

    l_ret_var               boolean;

  begin

    dbms_application_info.set_action('r_bool');

    if round(dbms_random.value(1,100)) <= r_likelyhood then
      l_ret_var := true;
    else
      l_ret_var := false;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_bool;

  function r_natural (
    r_min             number          default 0
    , r_max           number          default 9007199254740992
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_natural');

    l_ret_var := round(dbms_random.value(r_min,r_max));

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_natural;

  function r_character (
    r_pool            varchar2        default null
    , r_alpha         boolean         default false
    , r_casing        varchar2        default 'mixed'
    , r_symbols       boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(100);

    -- The position on the character pool to pick.
    l_pool_pos              number;

  begin

    dbms_application_info.set_action('r_character');

    -- If pool is not null, we build the random char based on the pool set.
    -- This is done, by getting a random number and then taking the char from
    -- that position in the pool.
    if r_pool is not null then
      l_pool_pos := r_natural(1, length(r_pool));
      l_ret_var := substr(r_pool, l_pool_pos, 1);
    else
      if r_alpha then
        l_ret_var := dbms_random.string('X', 1);
      elsif r_symbols then
        l_pool_pos := r_natural(1, length(core_random_v.g_symbols_pool));
        l_ret_var := substr(core_random_v.g_symbols_pool, l_pool_pos, 1);
      else
        l_ret_var := dbms_random.string('P',1);
      end if;
    end if;

    if r_casing = 'lower' then
      l_ret_var := lower(l_ret_var);
    elsif r_casing = 'upper' then
      l_ret_var := upper(l_ret_var);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_character;

  function r_float (
    r_fixed           number          default 4
    , r_min           number          default -9007199254740992
    , r_max           number          default 9007199254740992
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_float');

    l_ret_var := dbms_random.value(r_min, r_max);

    dbms_application_info.set_action(null);

    return round(l_ret_var, r_fixed);

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_float;

  function r_integer (
    r_min             number          default -9007199254740992
    , r_max           number          default 9007199254740992
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_integer');

    l_ret_var := round(dbms_random.value(r_min,r_max));

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_integer;

  function r_string (
    r_length          number          default null
    , r_pool          varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_pool_pos              number;
    l_string_lenght         number := r_length;

  begin

    dbms_application_info.set_action('r_string');

    if l_string_lenght is null then
      l_string_lenght := r_natural(5,20);
    end if;

    if r_pool is null then
      l_ret_var := dbms_random.string('P',l_string_lenght);
    else
      for i in 1..l_string_lenght loop
        l_pool_pos := r_natural(1,length(r_pool));
        l_ret_var := l_ret_var || substr(r_pool, l_pool_pos, 1);
      end loop;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_string;

begin

  dbms_application_info.set_client_info('core_random');
  dbms_session.set_identifier('core_random');

end core_random;
/
