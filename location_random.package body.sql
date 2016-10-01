create or replace package body location_random

as

  function r_country (
    r_shortform           boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country_idx           number := core_random.r_natural(1, location_data.countries.count);

  begin

    dbms_application_info.set_action('r_country');

    if r_shortform then
      l_ret_var := location_data.countries(l_country_idx).country_short;
    else
      l_ret_var := location_data.countries(l_country_idx).country_name;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_country;

  function r_height (
    r_feet                boolean         default false
    , r_livable           boolean         default true
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_height');

    if r_livable then
      l_ret_var := core_random.r_natural(0, core_random_v.g_highest_livable_point);
    else
      l_ret_var := core_random.r_natural(0, core_random_v.g_highest_point);
    end if;

    if r_feet then
      l_ret_var := round(l_ret_var * 3.2808);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_height;

  function r_depth (
    r_feet                boolean         default false
    , r_onland            boolean         default false
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_depth');

    if r_onland then
      l_ret_var := core_random.r_natural(0, core_random_v.g_lowest_point_land);
    else
      l_ret_var := core_random.r_natural(0, core_random_v.g_lowest_point_ocean);
    end if;

    if r_feet then
      l_ret_var := round(l_ret_var * 3.2808);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_depth;

  function r_latitude (
    r_precision           number          default 5
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_latitude');

    l_ret_var := core_random.r_float(r_precision, -90, 90);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_latitude;

  function r_longtitude (
    r_precision           number          default 5
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_longtitude');

    l_ret_var := core_random.r_float(r_precision, -180, 180);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_longtitude;

  function r_coordinate (
    r_precision           number          default 5
  )
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_coordinate');

    l_ret_var := to_char(r_latitude(r_precision)) || ', ' || to_char(r_longtitude(r_precision));

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_coordinate;

  function r_altitude (
    r_feet                boolean         default false
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_altitude');

    l_ret_var := core_random.r_natural(0,12192);

    if r_feet then
      l_ret_var := round(l_ret_var * 3.2808);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_altitude;

begin

  dbms_application_info.set_client_info('location_random');
  dbms_session.set_identifier('location_random');

end location_random;
/
