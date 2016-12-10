create or replace package body company_random

as

  function r_companyname (
    r_country         varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_country               varchar2(10) := r_companyname.r_country;

  begin

    dbms_application_info.set_action('r_companyname');

    if core_random.r_bool then
      l_ret_var := person_random.r_firstname(l_country);
    else
      if core_random.r_bool then
        -- Add the and adjective
        l_ret_var := 'The ' || util_random.ru_pickone(text_data.g_adj_descriptive_company);
      else
        -- Add description
        l_ret_var := util_random.ru_pickone(text_data.g_adj_positive_company);
      end if;
    end if;

    l_ret_var := l_ret_var || ' ' || util_random.ru_pickone(company_data.g_company_endings);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_companyname;

  function r_industry (
    r_country         varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(500);
    l_country               varchar2(10) := r_industry.r_country;

  begin

    dbms_application_info.set_action('r_industry');

    if l_country is null then
      l_country := util_random.ru_pickone(core_random_v.g_job_data_implemented);
    end if;

    l_ret_var := person_data.country_jobs(l_country)(core_random.r_natural(1, person_data.country_jobs(l_country).count)).job_sector;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_industry;

  function r_companyid (
    r_country         varchar2        default null
    , r_formatted     boolean         default true
  )
  return varchar2

  as

    l_ret_var               varchar2(4000);
    l_country               varchar2(10) := r_companyid.r_country;

  begin

    dbms_application_info.set_action('r_companyid');

    if l_country is null then
      l_country := util_random.ru_pickone(core_random_v.g_tax_id_implemented);
    end if;

    l_ret_var := company_data.tax_id(l_country).tax_id_format;
    l_ret_var := util_random.ru_replace_ranges(l_ret_var);
    l_ret_var := util_random.ru_numcharfy(l_ret_var);

    if r_formatted then
      l_ret_var := util_random.ru_display_format(l_ret_var, company_data.tax_id(l_country).tax_id_display_format);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_companyid;

  function r_employees (
    r_companysize     varchar2        default null
  )
  return number

  as

    l_ret_var               number;
    l_companysize           varchar2(150) := r_employees.r_companysize;

  begin

    dbms_application_info.set_action('r_employees');

    if l_companysize is null then
      l_companysize := util_random.ru_pickone('small,medium,large,corperation');
    end if;

    if l_companysize = 'small' then
      l_ret_var := core_random.r_natural(1,25);
    elsif l_companysize = 'medium' then
      l_ret_var := core_random.r_natural(26,400);
    elsif l_companysize = 'large' then
      l_ret_var := core_random.r_natural(401,3000);
    elsif l_companysize = 'corperation' then
      l_ret_var := core_random.r_natural(3000,150000);
    else
      l_ret_var := company_random.r_employees;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_employees;

  function r_revenue (
    r_companysize     varchar2        default null
  )
  return number

  as

    l_ret_var               number;
    l_companysize           varchar2(150) := r_revenue.r_companysize;

  begin

    dbms_application_info.set_action('r_revenue');

    if l_companysize is null then
      l_companysize := util_random.ru_pickone('small,medium,large,corperation');
    end if;

    if l_companysize = 'small' then
      l_ret_var := finance_random.r_amount(10000,5000000);
    elsif l_companysize = 'medium' then
      l_ret_var := finance_random.r_amount(5000000,20000000);
    elsif l_companysize = 'large' then
      l_ret_var := finance_random.r_amount(20000000,100000000);
    elsif l_companysize = 'corperation' then
      l_ret_var := finance_random.r_amount(100000000,2000000000);
    else
      l_ret_var := company_random.r_revenue;
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_revenue;

begin

  dbms_application_info.set_client_info('company_random');
  dbms_session.set_identifier('company_random');

end company_random;
/
