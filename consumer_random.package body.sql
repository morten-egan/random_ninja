create or replace package body consumer_random

as

  function r_category (
    r_food_item             boolean         default false
    , r_nonfood_item        boolean         default false
  )
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_category');

    if r_category.r_food_item and r_category.r_nonfood_item then
      l_ret_var := util_random.ru_pickone(consumer_data.food_categories || ',' || consumer_data.nonfood_categories);
    elsif r_category.r_food_item and not r_category.r_nonfood_item then
      l_ret_var := util_random.ru_pickone(consumer_data.food_categories);
    elsif r_category.r_nonfood_item and not r_category.r_food_item then
      l_ret_var := util_random.ru_pickone(consumer_data.nonfood_categories);
    else
      l_ret_var := util_random.ru_pickone(consumer_data.food_categories || ',' || consumer_data.nonfood_categories);
    end if;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_category;

  function r_food_item (
    r_category              varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_category              varchar2(100) := r_food_item.r_category;

  begin

    dbms_application_info.set_action('r_food_item');

    if l_category is null then
      l_category := util_random.ru_pickone(consumer_data.food_categories);
    end if;

    l_ret_var := consumer_data.items(l_category)(core_random.r_natural(1, consumer_data.items(l_category).count)).item_name;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_food_item;

  function r_nonfood_item (
    r_category              varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);
    l_category              varchar2(100) := r_nonfood_item.r_category;

  begin

    dbms_application_info.set_action('r_nonfood_item');

    if l_category is null then
      l_category := util_random.ru_pickone(consumer_data.nonfood_categories);
    end if;

    l_ret_var := consumer_data.items(l_category)(core_random.r_natural(1, consumer_data.items(l_category).count)).item_name;

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_nonfood_item;

  function r_service_item (
    r_category              varchar2        default null
  )
  return varchar2

  as

    l_ret_var               varchar2(100);

  begin

    dbms_application_info.set_action('r_service_item');

    l_ret_var := util_random.ru_pickone(consumer_data.service_category);

    dbms_application_info.set_action(null);

    return l_ret_var;

    exception
      when others then
        dbms_application_info.set_action(null);
        raise;

  end r_service_item;

begin

  dbms_application_info.set_client_info('consumer_random');
  dbms_session.set_identifier('consumer_random');

end consumer_random;
/
