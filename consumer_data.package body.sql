create or replace package body consumer_data

as

begin

  dbms_application_info.set_client_info('consumer_data');
  dbms_session.set_identifier('consumer_data');

  additives := additive_group_list(null);
  additives.extend(7);

  additives(1).group_name := 'Colours';
  additives(1).additives := 'E100,E101,E102,E104,E110,E120,E122,E123,E124,E127,E129,E131,E132,E133,E140,E141,E142,E150a,E150b,E150c,E150d,E151,E153,E155,E160a,E160b,E160c,E160d,E160e,E161b,E161g,E162,E163,E170,E171,E172,E173,E174,E175,E180';
  additives(2).group_name := 'Preservatives';
  additives(2).additives := 'E200,E202,E203,E210,E211,E212,E213,E214,E215,E218,E219,E220,E221,E222,E223,E224,E226,E227,E228,E234,E235,E239,E242,E243,E249,E250,E251,E252,E280,E281,E282,E283,E284,E285,E1105';
  additives(3).group_name := 'Antioxidants';
  additives(3).additives := 'E300,E301,E302,E304,E306,E307,E308,E309,E310,E311,E312,E315,E316,E319,E320,E321,E392,E586';
  additives(4).group_name := 'Sweeteners';
  additives(4).additives := 'E420,E421,E950,E951,E952,E953,E954,E955,E957,E959,E960,E961,E962,E964,E965,E966,E967,E968,E969';
  additives(5).group_name := 'Emulsifiers';
  additives(5).additives := 'E322,E400,E401,E402,E403,E404,E405,E406,E407,E407a,E410,E412,E413,E414,E415,E416,E417,E418,E425,E426,E427,E432,E433,E434,E435,E436,E440,E442,E444,E445,E460,E461,E462,E463,E464,E465,E466,E468,E469,E470a,E470b,E471,E472a,E472b,E472c,E472d,E472e,E472f,E473,E474,E475,E476,E477,E479b,E481,E482,E483,E491,E492,E493,E494,E495,E1103';
  additives(6).group_name := 'Others';
  additives(6).additives := 'E260,E261,E262,E263,E270,E290,E296,E297,E325,E326,E327,E330,E331,E332,E333,E334,E335,E336,E337,E338,E339,E340,E341,E343,E350,E351,E352,E353,E354,E355,E356,E357,E363,E380,E385,E422,E423,E431,E450,E451,E452,E459,E499,E500,E501,E503,E504,E507,E508,E509,E511,E512,E513,E514,E515,E516,E517,E520,E521,E522,E523,E524,E525,E526,E527,E528,E529,E530,E535,E536,E538,E541,E551,E552,E553a,E553b,E554,E555,E556,E559,E570,E574,E575,E576,E577,E578,E579,E585,E620,E621,E622,E623,E624,E625,E626,E627,E628,E629,E630,E631,E632,E633,E634,E635,E640,E641,E650,E900,E901,E902,E903,E904,E905,E907,E912,E914,E920,E927b,E938,E939,E941,E942,E943a,E943b,E944,E948,E949,E999,E1200,E1201,E1202,E1203,E1204,E1205,E1206,E1207,E1208,E1209,E1404,E1410,E1412,E1413,E1414,E1420,E1422,E1440,E1442,E1450,E1451,E1452,E1505,E1517,E1518,E1519,E1520,E1521';

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
  items('Frozen food') := consumer_item_list(null);

  -- Kitchen Items.
  items('Kitchen')(1).item_name := 'Butchers knife';
  items('Kitchen')(1).item_price_start := 10;
  items('Kitchen')(1).item_price_end := 500;

  -- Dairy Items.
  items('Dairy')(1).item_name := 'Full Milk';
  items('Dairy')(1).item_price_start := 1;
  items('Dairy')(1).item_price_end := 8;

end consumer_data;
/
