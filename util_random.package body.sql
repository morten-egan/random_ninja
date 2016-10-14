create or replace package body util_random

as

  function ru_extract (
    ru_elements       varchar2
    , ru_extract_n    number          default 1
    , ru_seperator    varchar2        default ','
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);
    l_elem_count            number := regexp_count(ru_elements, ru_seperator);
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
      elsif ru_extract_n = l_elem_count then
        -- Last element situation
        l_elem_start_location := instr(ru_elements, ru_seperator, 1, l_elem_count) + 1;
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
    , ru_replace_char     varchar2 default 'X'
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

    l_ret_var               varchar2(100) := ru_string;
    l_replace_loc_start     number;
    l_replace_loc_end       number;
    l_range_start           varchar2(100);
    l_range_end             varchar2(100);
    l_replace_val           varchar2(100);

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
        execute immediate 'select core_random.r_natural(' || l_range_start || ',' || l_range_end || ') from dual' into l_replace_val;
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

begin

  dbms_application_info.set_client_info('util_random');
  dbms_session.set_identifier('util_random');

end util_random;
/
