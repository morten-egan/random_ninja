create or replace package body science_random

as

  function r_chemicalelement (
    r_shortform       boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_element_idx           number;

  begin

    dbms_application_info.set_action('r_chemicalelement');

    l_element_idx := core_random.r_natural(1, science_data.g_natural_elements.count);

    if r_shortform then
      l_ret_var := science_data.g_natural_elements(l_element_idx).short_name;
    else
      l_ret_var := science_data.g_natural_elements(l_element_idx).full_name;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_chemicalelement;

  function r_ngcgalaxy
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_ngcgalaxy');

    l_ret_var := util_random.ru_replace_ranges('NGC[1011-5555]');

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_ngcgalaxy;

  function r_gsc2id
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_gsc2id');

    l_ret_var := 'S' || lpad(to_char(core_random.r_natural(1, 113264)), 10, '0');

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_gsc2id;

  function r_planet
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_planet');

    l_ret_var := util_random.ru_pickone(science_data.g_planets);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_planet;

  function r_casrn
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_casrn');

    l_ret_var := to_char(core_random.r_natural(1250, 17542)) || '-' || to_char(core_random.r_natural(10,70));

    l_ret_var := l_ret_var || '-' || to_char(util_random.ru_casrn_checkdigit(l_ret_var));

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_casrn;

  function r_scale
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_scale');

    l_ret_var := '1:' || util_random.ru_pickone(science_data.g_used_map_scales);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_scale;

begin

  dbms_application_info.set_client_info('science_random');
  dbms_session.set_identifier('science_random');

end science_random;
/
