create or replace package body phone_random

as

  function r_imei (
    r_imeisv              boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_imei');

    -- First get a TAC then add a random serial number.
    l_ret_var := util_random.ru_pickone(core_random_v.g_phone_tacs) || '-' || core_random.r_string(6,'0123456789');

    if r_imeisv then
      -- Add a 2 digit version.
      l_ret_var := l_ret_var || core_random.r_string(2,'0123456789');
    else
      -- Just add a single digit between 1-9
      l_ret_var := l_ret_var || core_random.r_string(1,'123456789');
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_imei;

  function r_meid
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_meid');

    l_ret_var := util_random.ru_pickone(core_random_v.g_meid_prefix1 || ',' || core_random_v.g_meid_prefix2);

    l_ret_var := l_ret_var || upper(core_random.r_hex(6));

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_meid;

  function r_country_calling_code (
    r_country             varchar2      default core_random_v.g_default_country_code
    , r_useplus           boolean       default true
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(10) := r_country;

  begin

    dbms_application_info.set_action('r_country_calling_code');

    if l_country is null then
      l_country := location_random.r_country(true);
    end if;

    if r_useplus then
      l_ret_var := '+' || phone_data.country_phone_data(l_country).intl_num_code;
    else
      l_ret_var := '00' || phone_data.country_phone_data(l_country).intl_num_code;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_country_calling_code;

  function r_phonenumber (
    r_country                 varchar2      default core_random_v.g_default_country_code
    , r_include_country_code  boolean       default false
    , r_landline              boolean       default false
    , r_mobile                boolean       default false
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(10) := r_country;

  begin

    dbms_application_info.set_action('r_phonenumber');

    if l_country is null then
      l_country := location_random.r_country(true);
    end if;

    if r_landline then
      l_ret_var := phone_data.country_phone_data(l_country).phone_num_format_landline;
    elsif r_mobile then
      l_ret_var := phone_data.country_phone_data(l_country).phone_num_format_mobile;
    else
      if core_random.r_bool then
        l_ret_var := phone_data.country_phone_data(l_country).phone_num_format_landline;
      else
        l_ret_var := phone_data.country_phone_data(l_country).phone_num_format_mobile;
      end if;
    end if;

    if r_include_country_code then
      l_ret_var := r_country_calling_code(l_country) || l_ret_var;
    end if;

    l_ret_var := util_random.ru_replace(l_ret_var);
    l_ret_var := util_random.ru_replace_ranges(l_ret_var);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_phonenumber;

  function r_mcc (
    r_country                 varchar2      default core_random_v.g_default_country_code
  )
  return number

  as

    l_ret_var               number;
    l_country               varchar2(10) := r_country;

  begin

    dbms_application_info.set_action('r_mcc');

    if l_country is null then
      l_country := location_random.r_country(true);
    end if;

    l_ret_var := phone_data.country_phone_data(l_country).mcc_number;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_mcc;

  function r_mnc (
    r_country                 varchar2      default core_random_v.g_default_country_code
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(10) := r_country;

  begin

    dbms_application_info.set_action('r_mnc');

    if l_country is null then
      l_country := location_random.r_country(true);
    end if;

    l_ret_var := util_random.ru_pickone(phone_data.country_phone_data(l_country).mnc);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_mnc;

  function r_imsi (
    r_country                 varchar2      default 'US'
  )
  return number

  as

    l_ret_var               number;
    l_temp_build_up         varchar2(25);
    l_country               varchar2(10) := r_country;

  begin

    dbms_application_info.set_action('r_imsi');

    if l_country is null or l_country = '' then
      -- l_country := location_random.r_country(true);
      l_country := 'US';
    end if;

    l_temp_build_up := r_mcc(l_country) || r_mnc(l_country);

    l_temp_build_up := l_temp_build_up || core_random.r_natural(to_number(rpad('1', 15-length(l_temp_build_up), '0')), to_number(rpad('9', 15-length(l_temp_build_up), '9')));

    l_ret_var := to_number(l_temp_build_up);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_imsi;

  function r_call_type
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_call_type');

    l_ret_var := util_random.ru_pickone(phone_data.g_cdr_call_types);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_call_type;

  function r_call_type_service
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_call_type_service');

    l_ret_var := util_random.ru_pickone(phone_data.g_cdr_call_service_types);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_call_type_service;

  function r_operator_code (
    r_country                 varchar2      default core_random_v.g_default_country_code
  )
  return number

  as

    l_ret_var               number;
    l_country               varchar2(10) := r_country;

  begin

    dbms_application_info.set_action('r_operator_code');

    if l_country is null then
      l_country := location_random.r_country(true);
    end if;

    l_ret_var := to_number(r_mcc(l_country) || r_mnc(l_country));

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_operator_code;

  function r_brand
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_brand');

    l_ret_var := util_random.ru_pickone(phone_data.g_phone_brands);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_brand;

begin

  dbms_application_info.set_client_info('phone_random');
  dbms_session.set_identifier('phone_random');

end phone_random;
/
