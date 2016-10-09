create or replace package body consumer_data

as

begin

  dbms_application_info.set_client_info('consumer_data');
  dbms_session.set_identifier('consumer_data');

  items := category_items_list(null);

  items('Kitchen') := consumer_item_list(null);
  items('Clothes') := consumer_item_list(null);
  items('Electronics') := consumer_item_list(null);
  items('Cosmetics') := consumer_item_list(null);
  items('Leisure') := consumer_item_list(null);
  items('Jewelery') := consumer_item_list(null);
  items('Furniture') := consumer_item_list(null);
  items('Tools') := consumer_item_list(null);
  items('Produce') := consumer_item_list(null);
  items('Vegetables') := consumer_item_list(null);
  items('Fruits') := consumer_item_list(null);
  items('Meats') := consumer_item_list(null);
  items('Canned goods') := consumer_item_list(null);
  items('Dry goods') := consumer_item_list(null);
  items('Dairy') := consumer_item_list(null);
  items('Fish') := consumer_item_list(null);
  items('Beverages') := consumer_item_list(null);

  items('Kitchen')(1).item_name := 'Butchers knife';
  items('Kitchen')(1).item_price_start := 10;
  items('Kitchen')(1).item_price_end := 500;

end consumer_data;
/
