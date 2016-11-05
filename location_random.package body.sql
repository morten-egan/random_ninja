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

  function r_state (
    r_country             varchar2        default null
    , r_shortform         boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_state_num             number;
    l_country_idx           varchar2(20) := r_country;

  begin

    dbms_application_info.set_action('r_state');

    if l_country_idx is null then
      l_country_idx := util_random.ru_pickone(core_random_v.g_state_countries_implemented);
    end if;

    l_state_num := core_random.r_natural(1, location_data.states(l_country_idx).count);

    if r_shortform then
      l_ret_var := location_data.states(l_country_idx)(l_state_num).state_short;
    else
      l_ret_var := location_data.states(l_country_idx)(l_state_num).state_name;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_state;

  function r_zipcode (
    r_country             varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(20);
    l_country               varchar2(20) := r_country;

  begin

    dbms_application_info.set_action('r_zipcode');

    if l_country = 'US' then
      l_ret_var := core_random.r_string(5, '0123456789');
    else
      l_ret_var := core_random.r_string(5, '0123456789');
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_zipcode;

  function r_street (
    r_country             varchar2        default null
    , r_shortform         boolean         default false
    , r_syllables         number          default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(20) := r_country;
    l_syllables             number := r_syllables;
    l_pickle                number;

  begin

    dbms_application_info.set_action('r_street');

    if l_syllables is null then
      -- Set syllables between 1 and 3 by default.
      l_syllables := core_random.r_natural(1,3);
    end if;

    if l_country is null then
      l_country := util_random.ru_pickone(core_random_v.g_road_countries_implemented);
    end if;

    l_pickle := core_random.r_natural(1, location_data.road_endings(l_country).count);

    if r_shortform then
      l_ret_var := text_random.r_word(l_syllables, null, true) || ' ' || location_data.road_endings(l_country)(l_pickle).road_name_short;
    else
      l_ret_var := text_random.r_word(l_syllables, null, true) || ' ' || location_data.road_endings(l_country)(l_pickle).road_name_full;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_street;

  function r_address (
    r_country             varchar2        default null
    , max_address_num     number          default null
    , r_shortform         boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(20) := r_country;
    l_max_address_num       number := max_address_num;

  begin

    dbms_application_info.set_action('r_address');

    if l_country is null then
      l_country := util_random.ru_pickone(core_random_v.g_road_countries_implemented);
    end if;

    if l_max_address_num is null then
      l_max_address_num := 500;
    end if;

    l_ret_var := core_random.r_natural(1, l_max_address_num) || ' ' || r_street(l_country, r_shortform);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_address;

  function r_city (
    r_country             varchar2        default null
    , r_state             varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(100) := r_country;
    l_state                 varchar2(100) := r_state;
    l_state_num             number;

  begin

    dbms_application_info.set_action('r_city');

    if l_country is null then
      l_country := util_random.ru_pickone(core_random_v.g_cities_countries_implemented);
    end if;

    if l_state is null then
      l_state_num := core_random.r_natural(1, location_data.states(l_country).count);
    else
      for i in 1..location_data.states(l_country).count loop
        if location_data.states(l_country)(i).state_short = r_city.r_state then
          l_state_num := i;
          exit;
        end if;
      end loop;
      if l_state_num is null then
        l_state_num := core_random.r_natural(1, location_data.states(l_country).count);
      end if;
    end if;

    l_ret_var := util_random.ru_pickone(location_data.states(l_country)(l_state_num).cities);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_city;

  function r_address2 (
    r_country             varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(10) := r_address2.r_country;
    l_idx                   number;

  begin

    dbms_application_info.set_action('r_address2');

    if l_country is null then
      l_country := util_random.ru_pickone(core_random_v.g_road_countries_implemented);
    end if;

    l_idx := core_random.r_natural(1, location_data.second_addresses(l_country).count);

    l_ret_var := location_data.second_addresses(l_country)(l_idx) || ' ' || core_random.r_natural(1,600);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_address2;

  function r_level
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('r_level');

    l_ret_var := core_random.r_natural(2,65);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_level;

  function r_floor_space (
    r_continent           varchar2        default null
    , r_feet              boolean         default false
  )
  return number

  as

    l_ret_var               number;
    l_continent             varchar2(150) := r_floor_space.r_continent;
    l_w_min                 number;
    l_w_max                 number;
    l_continent_idx         number;

  begin

    dbms_application_info.set_action('r_floor_space');

    if l_continent is null then
      l_continent_idx := core_random.r_natural(1, location_data.continents.count);
    else
      for i in 1..location_data.continents.count loop
        if upper(l_continent) = upper(location_data.continents(i).continent_name) then
          l_continent_idx := i;
        end if;
      end loop;
      if l_continent_idx is null then
        l_continent_idx := core_random.r_natural(1, location_data.continents.count);
      end if;
    end if;

    -- Set some weighted values before generating size.
    l_w_min := location_data.continents(l_continent_idx).avg_floor_space - round((location_data.continents(l_continent_idx).avg_floor_space/100) * 20);
    l_w_max := location_data.continents(l_continent_idx).avg_floor_space + round((location_data.continents(l_continent_idx).avg_floor_space/100) * 20);
    l_ret_var := core_random.r_natural(10, 1000, l_w_min, l_w_max, 80);

    if r_feet then
      l_ret_var := round(l_ret_var * 10.7639104);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_floor_space;

  function r_continent
  return varchar2

  as

    l_ret_var               varchar2(500);

  begin

    dbms_application_info.set_action('r_continent');

    l_ret_var := location_data.continents(core_random.r_natural(1, location_data.continents.count)).continent_name;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_continent;

  function r_room_count (
    r_continent           varchar2          default null
  )
  return number

  as

    l_ret_var               number;
    l_continent             varchar2(150) := r_room_count.r_continent;
    l_continent_idx         number;
    l_w_min                 number;
    l_w_max                 number;

  begin

    dbms_application_info.set_action('r_room_count');

    if l_continent is null then
      l_continent_idx := core_random.r_natural(1, location_data.continents.count);
    else
      for i in 1..location_data.continents.count loop
        if upper(l_continent) = upper(location_data.continents(i).continent_name) then
          l_continent_idx := i;
        end if;
      end loop;
      if l_continent_idx is null then
        l_continent_idx := core_random.r_natural(1, location_data.continents.count);
      end if;
    end if;

    -- Set some weighted values before generating size.
    l_w_min := location_data.continents(l_continent_idx).avg_house_rooms - 1;
    l_w_max := location_data.continents(l_continent_idx).avg_house_rooms;
    l_ret_var := core_random.r_natural(1, l_w_max + 5, l_w_min, l_w_max, 80);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_room_count;

begin

  dbms_application_info.set_client_info('location_random');
  dbms_session.set_identifier('location_random');

end location_random;
/
