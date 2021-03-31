create or replace package body web_random

as

  function r_tld (
    include_country                 boolean         default false
    , include_generic               boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_search_space          varchar2(32000);

  begin

    dbms_application_info.set_action('r_tld');

    l_search_space := core_random_v.g_tld_orig_list;

    if include_country then
      l_search_space := l_search_space || ',' || core_random_v.g_tld_country_list;
    end if;

    if include_generic then
      l_search_space := l_search_space || ',' || core_random_v.g_tld_generic1 || ',' || core_random_v.g_tld_generic2;
    end if;

    l_ret_var := util_random.ru_pickone(l_search_space);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_tld;

  function r_domain (
    r_tld                           varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_tld                   varchar2(50) := r_domain.r_tld;

  begin

    dbms_application_info.set_action('r_domain');

    if l_tld is null then
      l_tld := web_random.r_tld;
    end if;

    l_ret_var := text_random.r_word || l_tld;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_domain;

  function r_email (
    r_firstname                     varchar2        default null
    , r_lastname                    varchar2        default null
    , r_name                        varchar2        default null
    , use_real_name                 boolean         default false
    , safe                          boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_email');

    if r_firstname is null and r_lastname is null and r_name is null then
      if use_real_name then
        l_ret_var := person_random.r_firstname || '@';
      else
        l_ret_var := text_random.r_word || '@';
      end if;
    elsif r_firstname is not null and r_lastname is not null then
      -- Chance between first.last or substr(first,1,1) || last
      if core_random.r_bool then
        l_ret_var := r_firstname || '.' || r_lastname || '@';
      else
        l_ret_var := substr(r_firstname, 1, 1) || r_lastname || '@';
      end if;
    elsif r_firstname is not null then
      -- Chance between just firstname or firstname plus some random number
      if core_random.r_bool then
        l_ret_var := r_firstname || '@';
      else
        l_ret_var := r_firstname || core_random.r_natural(11,3457) || '@';
      end if;
    elsif r_lastname is not null then
      -- Chance between just lastname or lastname plus some random number
      if core_random.r_bool then
        l_ret_var := r_lastname || '@';
      else
        l_ret_var := r_lastname || core_random.r_natural(11,3457) || '@';
      end if;
    elsif r_name is not null then
      -- Chance between replacing spaces with _ or .
      if core_random.r_bool then
        l_ret_var := replace(replace(r_name, ' ', '_'), '.', '') || '@';
      else
        l_ret_var := replace(replace(r_name, ' ', '.'), '..', '.') || '@';
      end if;
    else
      l_ret_var := text_random.r_word || '@';
    end if;

    if safe then
      l_ret_var := l_ret_var || 'example.com';
    else
      l_ret_var := l_ret_var || r_domain;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_email;

  function r_ipv4
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_ipv4');

    l_ret_var := core_random.r_natural(1,254) || '.' || core_random.r_natural(1,255) || '.' || core_random.r_natural(1,255) || '.' || core_random.r_natural(1,254);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_ipv4;

  function r_url (
    use_secure                      boolean         default false
    , add_query                     boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);

  begin

    dbms_application_info.set_action('r_url');

    if use_secure then
      l_ret_var := 'https://www.' || r_domain;
    else
      l_ret_var := web_random.r_protocol || '://www.' || r_domain;
    end if;

    l_ret_var := l_ret_var || '/' || text_random.r_word || '.html';

    if add_query then
      l_ret_var := l_ret_var || '?' || text_random.r_word(1) || '=' || text_random.r_word(2);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

  end r_url;

  function r_ipv6
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_ipv6');

    l_ret_var := core_random.r_string(4, core_random_v.g_hex_search_space) || ':' || core_random.r_string(4, core_random_v.g_hex_search_space) || ':' || core_random.r_string(4, core_random_v.g_hex_search_space) || ':' || core_random.r_string(4, core_random_v.g_hex_search_space) || ':' || core_random.r_string(4, core_random_v.g_hex_search_space) || ':' || core_random.r_string(4, core_random_v.g_hex_search_space) || ':' || core_random.r_string(4, core_random_v.g_hex_search_space) || ':' || core_random.r_string(4, core_random_v.g_hex_search_space);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_ipv6;

  function r_protocol
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_protocol');

    if core_random.r_bool then
      l_ret_var := 'http';
    else
      l_ret_var := 'https';
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_protocol;

  function r_password
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_password');

    l_ret_var := core_random.r_hex(64);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_password;

  function r_mac
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_mac');

    l_ret_var := core_random.r_hex(12);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_mac;

  function r_color
  return varchar2

  as

    l_ret_var               varchar2(100) := util_random.ru_replace_ranges('([0-255], [0-255], [0-255])');

  begin

    dbms_application_info.set_action('r_color');

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_color;

  function r_bem (
    r_bem_domain                  varchar2          default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);

    l_bem_domain            varchar2(100) := r_bem_domain;

  begin

    dbms_application_info.set_action('r_bem');

    if l_bem_domain is null or not util_random.ru_inlist(l_bem_domain, web_data.g_bem_domains) then
      l_bem_domain := util_random.ru_pickone(web_data.g_bem_domains);
    end if;

    l_ret_var := util_random.ru_pickone(web_data.g_css_bem_block_names) || '__' || util_random.ru_pickone(web_data.g_css_bem_element_names) || '_' || util_random.ru_pickone(web_data.g_css_bem_modifier_names);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_bem;

begin

  dbms_application_info.set_client_info('web_random');
  dbms_session.set_identifier('web_random');

end web_random;
/
