create or replace package body util_random

as

  function ru_isnumeric (
    ru_value_in       varchar2
  )
  return boolean

  as

    l_test_number     number;

  begin

    l_test_number := to_number(ru_value_in);

    return true;

    exception
      when others then
        return false;

  end ru_isnumeric;

  function ru_extract (
    ru_elements       varchar2
    , ru_extract_n    number          default 1
    , ru_seperator    varchar2        default ','
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);
    l_elem_count            number := regexp_count(ru_elements, ru_seperator) + 1;
    l_elem_start_location   number;
    l_elem_end_location     number;
    l_substr_length         number;

  begin

    dbms_application_info.set_action('ru_extract');

    -- If we do not have any elements return back the full string.
    if l_elem_count = 0 then
      l_elem_start_location := 1;
      l_elem_end_location := length(ru_elements);
    elsif l_elem_count < ru_extract_n then
      -- Wants an element higher than what is available. Return last
      l_elem_start_location := instr(ru_elements, ru_seperator, 1, l_elem_count) + 1;
      l_elem_end_location := length(ru_elements);
    else
      if ru_extract_n = 1 then
        -- First element situation
        l_elem_start_location := 1;
        l_elem_end_location := instr(ru_elements, ru_seperator) - 1;
      elsif ru_extract_n = (l_elem_count) then
        -- Last element situation
        l_elem_start_location := instr(ru_elements, ru_seperator, 1, l_elem_count - 1) + 1;
        l_elem_end_location := length(ru_elements);
      else
        -- In between element situation.
        -- Set start and end.
        l_elem_start_location := instr(ru_elements, ru_seperator, 1, ru_extract_n - 1) + 1;
        l_elem_end_location := instr(ru_elements, ru_seperator, 1, ru_extract_n) - 1;
      end if;
    end if;

    -- Calculate end position as a relative to the start position, for the substr command.
    l_substr_length := (l_elem_end_location - l_elem_start_location) + 1;

    l_ret_var := substr(ru_elements, l_elem_start_location, l_substr_length);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_extract;

  function ru_pickone (
    ru_elements       varchar2
    , ru_seperator    varchar2        default ','
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);
    l_elem_count            number := regexp_count(ru_elements, ru_seperator);
    l_rand_elem             number;

  begin

    dbms_application_info.set_action('ru_pickone');

    if l_elem_count = 0 then
      l_ret_var := ru_elements;
    else
      l_elem_count := l_elem_count + 1;
      l_rand_elem := core_random.r_natural(1, l_elem_count);
      l_ret_var := ru_extract(ru_elements, l_rand_elem, ru_seperator);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_pickone;

  function luhn_calculate (
    digits            varchar2
  )
  return number

  as

    l_ret_var               number := 0;
    l_digit_count           number;
    l_digit                 number;

  begin

    dbms_application_info.set_action('luhn_calculate');

    l_digit_count := length(digits);

    for i in 1..l_digit_count loop
      if mod(i,2) = 0 then
        l_digit := substr(digits, i, 1);
        l_digit := l_digit*2;
        if l_digit > 9 then
          l_digit := l_digit - 9;
        end if;
        l_ret_var := l_ret_var + l_digit;
      end if;
    end loop;

    l_ret_var := l_ret_var * 9;

    l_ret_var := mod(l_ret_var,10);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end luhn_calculate;

  function ru_inlist (
    ru_elements           varchar2
    , ru_value            varchar2
    , ru_seperator        varchar2 default ','
    , ru_case_sensitive   boolean default true
  )
  return boolean

  as

    l_ret_var               boolean := false;

    cursor iterate_elements is
      select
        regexp_substr(ru_elements,'[^' || ru_seperator || ']+', 1, level) elem
      from
        dual
      connect by
        regexp_substr(ru_elements, '[^' || ru_seperator || ']+', 1, level) is not null;

  begin

    dbms_application_info.set_action('ru_inlist');

    for x in iterate_elements loop
      if ru_case_sensitive then
        if ru_value = x.elem then
          l_ret_var := true;
        end if;
      else
        if upper(ru_value) = upper(x.elem) then
          l_ret_var := true;
        end if;
      end if;
    end loop;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_inlist;

  function ru_replace (
    ru_string             varchar2
    , ru_replace_char     varchar2 default '#'
    , ru_replace_func     varchar2 default 'core_random.r_natural(1,9)'
  )
  return varchar2

  as

    l_ret_var               varchar2(4000) := ru_string;
    l_replace_val           varchar2(10);
    l_replace_location      number;

  begin

    dbms_application_info.set_action('ru_replace');

    l_replace_location := instr(l_ret_var, ru_replace_char);

    while l_replace_location > 0 loop
      execute immediate 'select ' || ru_replace_func || ' from dual' into l_replace_val;
      l_ret_var := substr(l_ret_var, 1, l_replace_location -1) || l_replace_val || substr(l_ret_var, l_replace_location + 1);
      l_replace_location := instr(l_ret_var, ru_replace_char);
    end loop;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_replace;

  function ru_replace_ranges (
    ru_string             varchar2
    , ru_range_marker     varchar2 default '[]'
  )
  return varchar2

  as

    l_ret_var               varchar2(4000) := ru_string;
    l_replace_loc_start     number;
    l_replace_loc_end       number;
    l_range_start           varchar2(100);
    l_range_end             varchar2(100);
    l_replace_val           varchar2(100);

    l_char_start            number;
    l_char_end              number;

  begin

    dbms_application_info.set_action('ru_replace_ranges');

    l_replace_loc_start := instr(l_ret_var, substr(ru_range_marker,1,1));
    l_replace_loc_end := instr(l_ret_var, substr(ru_range_marker,2));

    while l_replace_loc_start > 0 and l_replace_loc_end > 0 loop
      -- Determine if we have full range or if we have a finite set to choose from
      if instr(substr(l_ret_var, l_replace_loc_start, l_replace_loc_end - l_replace_loc_start), '-') > 0 then
        -- This is a bounded range set.
        l_range_start := substr(l_ret_var, l_replace_loc_start + 1, (instr(l_ret_var,'-', l_replace_loc_start) - 1) - l_replace_loc_start);
        l_range_end := substr(l_ret_var, instr(l_ret_var,'-', l_replace_loc_start) + 1, l_replace_loc_end - (instr(l_ret_var,'-', l_replace_loc_start) + 1));
        -- Check if we have alphabet range or numeric range.
        if ru_isnumeric(l_range_start) then
          execute immediate 'select core_random.r_natural(' || l_range_start || ',' || l_range_end || ') from dual' into l_replace_val;
        else
          -- We have a character. Get the ascii values to know the range.
          l_char_start := ascii(l_range_start);
          l_char_end := ascii(l_range_end);
          if l_char_end < l_char_start then
            l_char_start := ascii(l_range_end);
            l_char_end := ascii(l_range_start);
          end if;
          execute immediate 'select core_random.r_natural(' || l_char_start || ',' || l_char_end || ') from dual' into l_replace_val;
          l_replace_val := chr(l_replace_val);
        end if;
      elsif instr(substr(l_ret_var, l_replace_loc_start, l_replace_loc_end - l_replace_loc_start), ',') > 0 then
        -- We have a set of numbers to choose from, grab them and pick one.
        l_replace_val := ru_pickone(substr(l_ret_var, l_replace_loc_start + 1, (l_replace_loc_end - 1) - l_replace_loc_start));
      end if;

      l_ret_var := substr(l_ret_var, 1, l_replace_loc_start -1) || l_replace_val || substr(l_ret_var, l_replace_loc_end + 1);

      l_replace_loc_start := instr(l_ret_var, substr(ru_range_marker,1,1));
      l_replace_loc_end := instr(l_ret_var, substr(ru_range_marker,2));
    end loop;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_replace_ranges;

  function ru_numerify (
    ru_string             varchar2
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);

  begin

    dbms_application_info.set_action('ru_numerify');

    l_ret_var := ru_replace(ru_string);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_numerify;

  function ru_charify (
    ru_string             varchar2
    , ru_upper            boolean default false
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);

  begin

    dbms_application_info.set_action('ru_charify');

    l_ret_var := ru_replace(ru_string, '?', 'core_random.r_character(''abcdefghijklmnopqrstuvwxyz'')');

    if ru_upper then
      l_ret_var := upper(l_ret_var);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_charify;

  function ru_numcharfy (
    ru_string             varchar2
    , ru_upper            boolean default false
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);

  begin

    dbms_application_info.set_action('ru_numcharfy');

    l_ret_var := ru_numerify(ru_string);
    l_ret_var := ru_charify(l_ret_var);

    if ru_upper then
      l_ret_var := upper(l_ret_var);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_numcharfy;

  function ru_datify (
    ru_string             varchar2
    , ru_date             date        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(4000) := ru_datify.ru_string;
    l_date                  date := ru_datify.ru_date;

  begin

    dbms_application_info.set_action('ru_datify');

    if l_date is null then
      l_date := time_random.r_date;
    end if;

    -- Go through the supported formats and replace.
    -- First we replace YYYY
    l_ret_var := replace(l_ret_var, 'YYYY', to_char(l_date,'YYYY'));
    -- Then we replace YY
    l_ret_var := replace(l_ret_var, 'YY', to_char(l_date,'YY'));
    -- Replace MM
    l_ret_var := replace(l_ret_var, 'MM', to_char(l_date,'MM'));
    -- Replace MON
    l_ret_var := replace(l_ret_var, 'MON', to_char(l_date,'MON'));
    -- Replace Mon
    l_ret_var := replace(l_ret_var, 'Mon', to_char(l_date,'Mon'));
    -- Replace DD
    l_ret_var := replace(l_ret_var, 'DD', to_char(l_date,'DD'));
    -- Replace Day
    l_ret_var := replace(l_ret_var, 'Day', to_char(l_date,'Day'));

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_datify;

  function ru_display_format (
    ru_string             varchar2
    , ru_format           varchar2
    , ru_add_missing      boolean     default true
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);
    l_string                varchar2(4000) := ru_display_format.ru_string;

  begin

    dbms_application_info.set_action('ru_display_format');

    if (regexp_count(ru_format, '\?') + regexp_count(ru_format,'#')) = length(ru_string) then
      -- One to one char formatting. Use anything else but the question mark, to format string.
      for i in 1..length(ru_format) loop
        if substr(ru_format, i, 1) = '?' or substr(ru_format, i, 1) = '#' then
          l_ret_var := l_ret_var || substr(l_string, 1, 1);
          l_string := substr(l_string, 2);
        else
          l_ret_var := l_ret_var || substr(ru_format, i, 1);
        end if;
      end loop;
    elsif (regexp_count(ru_format, '?') + regexp_count(ru_format,'#')) > length(ru_string) then
      -- Format is longer then string to be formatted. If r_add_missing we will add missing char/num to formatted string.
      for i in 1..length(ru_format) loop
        if substr(ru_format, i, 1) = '?' or substr(ru_format, i, 1) = '#' then
          if l_string is not null then
            l_ret_var := l_ret_var || substr(l_string, 1, 1);
            l_string := substr(l_string, 2);
          else
            if ru_add_missing then
              if substr(ru_format, i, 1) = '?' then
                l_ret_var := l_ret_var || 'X';
              else
                l_ret_var := l_ret_var || 1;
              end if;
            end if;
          end if;
        else
          l_ret_var := l_ret_var || substr(ru_format, i, 1);
        end if;
      end loop;
    elsif (regexp_count(ru_format, '?') + regexp_count(ru_format,'#')) < length(ru_string) then
      -- Missing some formatting compared to actual string. Just format as much as possible.
      for i in 1..length(ru_format) loop
        if substr(ru_format, i, 1) = '?' or substr(ru_format, i, 1) = '#' then
          l_ret_var := l_ret_var || substr(l_string, 1, 1);
          l_string := substr(l_string, 2);
        else
          l_ret_var := l_ret_var || substr(ru_format, i, 1);
        end if;
      end loop;
      -- Add the rest of the string to the formatted string.
      l_ret_var := l_ret_var || l_string;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_display_format;

  function ru_pickone_weighted (
    ru_elements       varchar2
    , ru_seperator    varchar2        default ','
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);
    l_element_count         number;
    l_weighted_count        number;
    l_weight_undef          number;
    type w_tab is table of varchar2(3) index by varchar2(4000);
    l_weighted              w_tab;
    l_element_val           varchar2(4000);
    l_current_total_weight  number := 0;
    l_weight_idx            varchar2(4000);

  begin

    dbms_application_info.set_action('ru_pickone_weighted');

    l_element_count := regexp_count(ru_elements, ',');
    l_weighted_count := regexp_count(ru_elements, '\[');

    if l_weighted_count = 0 then
      -- No weights at all in the list. Make all elements equal weight.
      l_ret_var := util_random.ru_pickone(ru_elements, ru_seperator);
    else
      for i in 1..(l_element_count + 1) loop
        l_element_val := util_random.ru_extract(ru_elements, i);
        l_current_total_weight := l_current_total_weight + substr(l_element_val, instr(l_element_val,'[') + 1, (length(l_element_val)) - instr(l_element_val,'[') - 1 );
        -- l_weighted(l_current_total_weight) := substr(l_element_val, 1, instr(l_element_val,'[') - 1);
        l_weighted(substr(l_element_val, 1, instr(l_element_val,'[') - 1)) := l_current_total_weight;
      end loop;

      -- Now we have the full weighted list. Generate a percent and extract the element value.
      l_current_total_weight := core_random.r_natural(1,100);
      l_weight_idx := l_weighted.first;
      while l_weight_idx is not null loop
        if l_current_total_weight >= (100 - l_weighted(l_weight_idx)) then
          l_ret_var := l_weight_idx;
          l_weight_idx := null;
        else
          l_weight_idx := l_weighted.next(l_weight_idx);
        end if;
      end loop;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_pickone_weighted;

  function iban_checksum (
    ru_iban           varchar2
    , ru_country      varchar2
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_calc_factor           number := 55;
    l_country               varchar2(10) := ru_country;
    l_iban                  varchar2(50) := ru_iban;
    l_iban_tmp              varchar2(50);
    l_iban_tmp2             varchar2(50);
    l_iban_num_tmp          number;

  begin

    dbms_application_info.set_action('iban_checksum');

    if length(l_iban) = finance_data.country_bankaccounts(l_country).iban_length then
      -- Switch the first four characters to the end.
      l_iban_tmp := substr(l_iban, 5) || substr(l_iban, 1, 4);
      -- Convert all characters to integers.
      for i in 1..length(l_iban_tmp) loop
        if regexp_instr(substr(l_iban_tmp, i, 1), '[a-zA-Z]') > 0 then
          -- We have a letter that we need to convert to an integer.
          l_iban_num_tmp := ascii(upper(substr(l_iban_tmp, i, 1))) - l_calc_factor;
          -- Now we need to replace the char back in the string with the calculated integer.
          l_iban_tmp2 := l_iban_tmp2 || l_iban_num_tmp;
        else
          -- We have a number just append.
          l_iban_tmp2 := l_iban_tmp2 || to_char(substr(l_iban_tmp, i, 1));
        end if;
      end loop;

      l_iban_num_tmp := mod(to_number(l_iban_tmp2),97);
      l_iban_num_tmp := 98 - l_iban_num_tmp;
      l_iban_tmp := lpad(l_iban_num_tmp,2,0);
      l_ret_var := substr(l_iban, 1, 2) || to_char(l_iban_tmp) || substr(l_iban, 5);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end iban_checksum;

  function ru_permute (
    ru_string             varchar2
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);
    l_string                varchar2(4000) := ru_string;
    l_idx                   number;

  begin

    dbms_application_info.set_action('ru_permute');

    for i in 1..length(l_string) loop
      l_idx := core_random.r_natural(1, length(l_string));
      l_ret_var := l_ret_var || substr(l_string, l_idx, 1);
      l_string := substr(l_string, 1, l_idx - 1) || substr(l_string, l_idx + 1);
    end loop;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_permute;

  function ru_scramble (
    ru_string             varchar2
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);

  begin

    dbms_application_info.set_action('ru_scramble');

    for i in 1..length(ru_string) loop
      if substr(ru_string, i , 1) = ' ' then
        l_ret_var := l_ret_var || ' ';
      else
        l_ret_var := l_ret_var || core_random.r_character(null, true, 'lower', false);
      end if;
    end loop;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_scramble;

  function ru_obfuscate (
    ru_string             varchar2
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);
    l_new_min_length        number;
    l_new_max_length        number;

  begin

    dbms_application_info.set_action('ru_obfuscate');

    l_new_min_length := length(ru_string) - round(length(ru_string)/2);
    l_new_max_length := length(ru_string) + round(length(ru_string)/2);

    l_ret_var := core_random.r_string(core_random.r_natural(l_new_min_length, l_new_max_length));

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_obfuscate;

  function ru_suntime (
    ru_date               date              default sysdate
    , ru_suntype          varchar2          default 'sunrise'
  )
  return date

  as

    l_ret_var                 date;
    -- Current julian date
    l_current_julian_date     number;
    -- Mean solar noon
    l_mean_solar_noon         number;
    l_solar_mean_anomaly      number;
    l_equation_of_the_center  number;
    l_ecliptic_longitude      number;
    l_solar_transit           number;
    l_sun_declination         number;
    l_hour_angle              number;
    l_result_julian_date      number;

  begin

    dbms_application_info.set_action('ru_suntime');

    -- Steps
    -- Calculate current julian date.
    l_current_julian_date := to_number(to_char(ru_date,'J')) - 2451545.0 + 0.0008;
    --dbms_output.put_line('Current julian date since 2000: ' || l_current_julian_date);
    -- Calculate mean solar noon.
    -- Longitude west is currently fixed to london.
    l_mean_solar_noon := l_current_julian_date - (0.07/360);
    --dbms_output.put_line('Mean solar noon: ' || l_mean_solar_noon);
    -- Solar mean anomaly.
    l_solar_mean_anomaly := mod((357.5291 + 0.98560028 * l_mean_solar_noon),360);
    --dbms_output.put_line('Solar mean anomaly: ' || l_solar_mean_anomaly);
    -- Equation of the center
    l_equation_of_the_center := 1.9148*sin(l_solar_mean_anomaly) + 0.0200*sin(2*l_solar_mean_anomaly) + 0.0003*sin(3*l_solar_mean_anomaly);
    --dbms_output.put_line('Equation of the center: ' || l_equation_of_the_center);
    -- Ecliptic longitude
    l_ecliptic_longitude := mod((l_solar_mean_anomaly + l_equation_of_the_center + 180 + 102.9372),360);
    --dbms_output.put_line('Ecliptic longitude: ' || l_ecliptic_longitude);
    -- Solar transit
    l_solar_transit := 2451545.5 + l_mean_solar_noon + 0.0053*sin(l_solar_mean_anomaly) - 0.0069*sin(2*l_ecliptic_longitude);
    --dbms_output.put_line('Solar transit: ' || l_solar_transit);
    -- Declination of the sun
    l_sun_declination := sin(l_ecliptic_longitude) * sin(23.44);
    --dbms_output.put_line('Sun declination: ' || l_sun_declination);
    -- Hour angle. Latitude north currently fixed to london.
    l_hour_angle := (sin(-0.83) - sin(51.30)*sin(l_sun_declination))/(cos(51.30) * cos(l_sun_declination));
    --dbms_output.put_line('Hour angle: ' || l_hour_angle);

    if ru_suntype = 'sunrise' then
      l_result_julian_date := l_solar_transit - (l_hour_angle/360);
    else
      l_result_julian_date := l_solar_transit + (l_hour_angle/360);
    end if;

    --dbms_output.put_line('Julian date: ' || l_result_julian_date);

    l_ret_var := sysdate;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_suntime;

  function ru_number_increment (
    ru_increment_from     number            default 1
    , ru_min_increment    number            default 1
    , ru_max_increment    number            default 42
  )
  return number

  as

    l_ret_var               number;

  begin

    dbms_application_info.set_action('ru_number_increment');

    l_ret_var := ru_increment_from + core_random.r_natural(ru_min_increment, ru_max_increment);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_number_increment;

  function ru_date_increment (
    ru_increment_from     date              default sysdate
    , ru_increment_name   varchar2          default 'seconds'
    , ru_min_increment    number            default 1
    , ru_max_increment    number            default 59
  )
  return date

  as

    l_ret_var               date := ru_increment_from;

  begin

    dbms_application_info.set_action('ru_date_increment');

    if ru_increment_name = 'seconds' then
      l_ret_var := l_ret_var + ((1/86400) * core_random.r_natural(ru_min_increment, ru_max_increment));
    elsif ru_increment_name = 'minutes' then
      l_ret_var := l_ret_var + ((1/1440) * core_random.r_natural(ru_min_increment, ru_max_increment));
    elsif ru_increment_name = 'hours' then
      l_ret_var := l_ret_var + ((1/24) * core_random.r_natural(ru_min_increment, ru_max_increment));
    elsif ru_increment_name = 'days' then
      l_ret_var := l_ret_var + core_random.r_natural(ru_min_increment, ru_max_increment);
    elsif ru_increment_name = 'weeks' then
      l_ret_var := l_ret_var + (7 * core_random.r_natural(ru_min_increment, ru_max_increment));
    elsif ru_increment_name = 'months' then
      l_ret_var := add_months(l_ret_var, core_random.r_natural(ru_min_increment, ru_max_increment));
    elsif ru_increment_name = 'years' then
      l_ret_var := add_months(l_ret_var, (core_random.r_natural(ru_min_increment, ru_max_increment) * 12));
    else
      -- unknown name, add seconds.
      l_ret_var := l_ret_var + ((1/86400) * core_random.r_natural(ru_min_increment, ru_max_increment));
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_date_increment;

  function ru_random_row (
    ru_table              varchar2
    , ru_column           varchar2
    , ru_where_clause     varchar2          default null
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);

  begin

    dbms_application_info.set_action('ru_random_row');

    if ru_where_clause is null then
      execute immediate 'select '|| ru_column ||' from (select '|| ru_column ||' from '|| ru_table ||' '|| ru_where_clause ||' order by dbms_random.value) where rownum = 1'
      into l_ret_var;
    else
      execute immediate 'select '|| ru_column ||' from (select '|| ru_column ||' from '|| ru_table ||' order by dbms_random.value) where rownum = 1'
      into l_ret_var;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_random_row;

  function ru_isin_checkdigit (
    r_country             varchar2
    , r_nsin              varchar2
  )
  return number

  as

    l_ret_var               number;

    l_calc_factor           number := 55;
    l_converted             varchar2(50);
    l_sum                   number := 0;
    l_midcalc               varchar2(2);
    l_controldigit          number;

  begin

    dbms_application_info.set_action('ru_isin_checkdigit');

    l_converted := ascii(upper(substr(r_country, 1, 1))) - l_calc_factor;
    l_converted := l_converted || ascii(upper(substr(r_country, 2, 1))) - l_calc_factor;

    l_converted := l_converted || r_nsin;

    for i in 1..length(l_converted) loop
      if mod(i,2) = 0 then
        l_sum := l_sum + to_number(substr(l_converted, i, 1));
      else
        l_midcalc := to_number(substr(l_converted, i, 1)) * 2;
        if to_number(l_midcalc) > 9 then
          l_midcalc := to_number(substr(l_midcalc, 1, 1)) + to_number(substr(l_midcalc, 2, 1));
        end if;
        l_sum := l_sum + to_number(l_midcalc);
      end if;
    end loop;

    l_controldigit := mod(l_sum, 10);
    l_controldigit := 10 - l_controldigit;
    l_controldigit := mod(l_controldigit, 10);

    l_ret_var := l_controldigit;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_isin_checkdigit;

  function ru_casrn_checkdigit (
    r_casrn_no_chk        varchar2
  )
  return number

  as

    l_ret_var               number := 0;
    l_withoutdash           varchar2(50);
    l_multiply              number := 1;

  begin

    dbms_application_info.set_action('ru_casrn_checkdigit');

    l_withoutdash := replace(r_casrn_no_chk, '-');
    for i in reverse 1..length(l_withoutdash) loop
      l_ret_var := l_ret_var + (to_number(substr(l_withoutdash, i, 1)) * l_multiply);
      l_multiply := l_multiply + 1;
    end loop;

    l_ret_var := mod(l_ret_var, 10);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end ru_casrn_checkdigit;

begin

  dbms_application_info.set_client_info('util_random');
  dbms_session.set_identifier('util_random');

end util_random;
/
