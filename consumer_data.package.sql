create or replace package consumer_data

as

  /** Data for generating random consumer data.
  * @author Morten Egan
  * @version 0.0.1
  * @project NINJA_RANDOM
  */
  npg_version             varchar2(250) := '0.0.1';

  nonfood_categories      varchar2(32000) := 'Kitchen,Clothes,Electronics,Cosmetics,Leisure,Jewelery,Furniture,Tools';
  food_categories         varchar2(32000) := 'Produce,Vegetables,Fruits,Meats,Canned goods,Dry goods,Dairy,Fish,Beverages';

  type consumer_item is record (
    item_name             varchar2(4000)
    , item_price_start    number
    , item_price_end      number
  );
  type consumer_item_list is table of consumer_item;
  type category_items_list is table consumer_item_list index by varchar2(4000);

  items   category_items_list;

end consumer_data;
/
