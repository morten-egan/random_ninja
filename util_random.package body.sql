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

begin

  dbms_application_info.set_client_info('util_random');
  dbms_session.set_identifier('util_random');

end util_random;
/
