create or replace package body transport_random

as

  function r_imo
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_tmp_num               number := 0;

  begin

    dbms_application_info.set_action('r_imo');

    l_ret_var := util_random.ru_numerify('######');

    for i in 1..6 loop
      l_tmp_num := l_tmp_num + ((8-1) * substr(l_ret_var, i, 1));
    end loop;

    l_ret_var := 'IMO ' || l_ret_var || substr(to_char(l_tmp_num), -1, 1);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_imo;

  function r_icao (
    r_country         varchar2        default core_random_v.g_default_country_code
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(10) := r_icao.r_country;

  begin

    dbms_application_info.set_action('r_icao');

    if not transport_data.icao_aircraft_prefix.exists(l_country) then
      l_country := location_random.r_country(true);
    end if;

    l_ret_var := util_random.ru_replace_ranges(util_random.ru_numerify(util_random.ru_charify(transport_data.icao_aircraft_prefix(l_country), true)));

    -- Not all countries are in the aircraft register. 219 ICAO vs. 253 Countries.
    -- So just in case we got one of those countries, fix it.
    if l_ret_var is null then
      l_ret_var := transport_random.r_icao('US');
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_icao;

  function r_vehicle_registration (
    r_country         varchar2        default core_random_v.g_default_country_code
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(10) := r_vehicle_registration.r_country;

  begin

    dbms_application_info.set_action('r_vehicle_registration');

    if not transport_data.car_registration_formats.exists(l_country) then
      l_country := location_random.r_country(true);
    end if;

    l_ret_var := util_random.ru_replace_ranges(util_random.ru_numerify(util_random.ru_charify(transport_data.car_registration_formats(l_country), true)));

    -- Not all countries are in the vehivle register list.
    -- So just in case we got one of those countries, fix it.
    if l_ret_var is null then
      l_ret_var := transport_random.r_vehicle_registration('AU');
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_vehicle_registration;

begin

  dbms_application_info.set_client_info('transport_random');
  dbms_session.set_identifier('transport_random');

end transport_random;
/
