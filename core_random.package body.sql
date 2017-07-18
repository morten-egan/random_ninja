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
    , r_w_min         number          default null
    , r_w_max         number          default null
    , r_weight        number          default null
  )
  return number

  as

    l_ret_var               number;
    l_w_min                 number := r_w_min;
    l_w_max                 number := r_w_max;
    l_weight                number := r_weight;

  begin

    dbms_application_info.set_action('r_natural');

    if l_w_min is null and l_w_max is null then
      -- Do not use weighted range. Act as default.
      l_ret_var := round(dbms_random.value(r_min,r_max));
    else
      -- We info for a weighted range. Set and run.
      if l_w_min is null then
        l_w_min := r_min;
      end if;
      if l_w_max is null then
        l_w_max := r_max;
      end if;
      if l_weight is null then
        l_weight := 50;
      end if;
      if core_random.r_natural(0,100) <= l_weight then
        l_ret_var := core_random.r_natural(l_w_min, l_w_max);
      else
        l_ret_var := core_random.r_natural(r_min,r_max);
      end if;
    end if;

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
    , r_country       varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);

    -- The position on the character pool to pick.
    l_pool_pos              number;

  begin

    dbms_application_info.set_action('r_character');

    -- Special case for chinese, else ignore country.
    if r_country = 'CN' then
      l_pool_pos := r_natural(1, length(core_random_v.g_most_used_chinese_characters));
      l_ret_var := substr(core_random_v.g_most_used_chinese_characters, l_pool_pos, 1);
    else
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
    , r_w_min         number          default null
    , r_w_max         number          default null
    , r_weight        number          default null
  )
  return number

  as

    l_ret_var               number;
    l_w_min                 number := r_w_min;
    l_w_max                 number := r_w_max;
    l_weight                number := r_weight;

  begin

    dbms_application_info.set_action('r_float');

    if l_w_min is null and l_w_max is null then
      l_ret_var := dbms_random.value(r_min, r_max);
    else
      -- We info for a weighted range. Set and run.
      if l_w_min is null then
        l_w_min := r_min;
      end if;
      if l_w_max is null then
        l_w_max := r_max;
      end if;
      if l_weight is null then
        l_weight := 50;
      end if;
      if core_random.r_natural(0,100) <= l_weight then
        l_ret_var := core_random.r_float(r_fixed, l_w_min, l_w_max);
      else
        l_ret_var := core_random.r_float(r_fixed, r_min,r_max);
      end if;
    end if;

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
    , r_country       varchar2        default null
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

    -- Special case for chinese, ignore other languages.
    if r_country = 'CN' then
      for i in 1..l_string_lenght loop
        l_ret_var := l_ret_var || r_character(r_country => r_country);
      end loop;
    else
      if r_pool is null then
        l_ret_var := dbms_random.string('P',l_string_lenght);
      else
        for i in 1..l_string_lenght loop
          l_pool_pos := r_natural(1,length(r_pool));
          l_ret_var := l_ret_var || substr(r_pool, l_pool_pos, 1);
        end loop;
      end if;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_string;

  function r_hex (
    r_length          number          default null
    , r_upper         boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);
    l_string_lenght         number := r_length;

  begin

    dbms_application_info.set_action('r_hex');

    if l_string_lenght is null then
      l_string_lenght := r_natural(5,20);
    end if;

    l_ret_var := r_string(l_string_lenght, '0123456789abcdef');

    if r_upper then
      l_ret_var := upper(l_ret_var);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_hex;

begin

  dbms_application_info.set_client_info('core_random');
  dbms_session.set_identifier('core_random');

end core_random;
/
