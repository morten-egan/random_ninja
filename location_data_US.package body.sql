create or replace package body location_data_us

as

begin

  dbms_application_info.set_client_info('location_data_us');
  dbms_session.set_identifier('location_data_us');

  -- Init arrays
  location_data.states('US') := location_data.state_list(null);
  location_data.states('US').extend(50);
  location_data.road_endings('US') := location_data.road_list(null);
  location_data.road_endings('US').extend(34);
  location_data.second_addresses('US') := location_data.address2_list(null);
  location_data.second_addresses('US').extend(6);

  -- Address 2 names.
  location_data.second_addresses('US')(1) := 'Apartment';
  location_data.second_addresses('US')(2) := 'Suite';
  location_data.second_addresses('US')(3) := 'Coop';
  location_data.second_addresses('US')(4) := 'Residence';
  location_data.second_addresses('US')(5) := 'Condo';
  location_data.second_addresses('US')(6) := 'Flat';

  -- Road names.
  location_data.road_endings('US')(1).road_name_full := 'Avenue';
  location_data.road_endings('US')(1).road_name_short := 'Ave';
  location_data.road_endings('US')(2).road_name_full := 'Boulevard';
  location_data.road_endings('US')(2).road_name_short := 'Blvd';
  location_data.road_endings('US')(3).road_name_full := 'Center';
  location_data.road_endings('US')(3).road_name_short := 'Ctr';
  location_data.road_endings('US')(4).road_name_full := 'Circle';
  location_data.road_endings('US')(4).road_name_short := 'Cir';
  location_data.road_endings('US')(5).road_name_full := 'Court';
  location_data.road_endings('US')(5).road_name_short := 'Ct';
  location_data.road_endings('US')(6).road_name_full := 'Drive';
  location_data.road_endings('US')(6).road_name_short := 'Dr';
  location_data.road_endings('US')(7).road_name_full := 'Extension';
  location_data.road_endings('US')(7).road_name_short := 'Ext';
  location_data.road_endings('US')(8).road_name_full := 'Glen';
  location_data.road_endings('US')(8).road_name_short := 'Gln';
  location_data.road_endings('US')(9).road_name_full := 'Grove';
  location_data.road_endings('US')(9).road_name_short := 'Grv';
  location_data.road_endings('US')(10).road_name_full := 'Heights';
  location_data.road_endings('US')(10).road_name_short := 'Hts';
  location_data.road_endings('US')(11).road_name_full := 'Junction';
  location_data.road_endings('US')(11).road_name_short := 'Jct';
  location_data.road_endings('US')(12).road_name_full := 'Lane';
  location_data.road_endings('US')(12).road_name_short := 'Ln';
  location_data.road_endings('US')(13).road_name_full := 'Loop';
  location_data.road_endings('US')(13).road_name_short := 'Loop';
  location_data.road_endings('US')(14).road_name_full := 'Manor';
  location_data.road_endings('US')(14).road_name_short := 'Mnr';
  location_data.road_endings('US')(15).road_name_full := 'Mill';
  location_data.road_endings('US')(15).road_name_short := 'Mill';
  location_data.road_endings('US')(16).road_name_full := 'Park';
  location_data.road_endings('US')(16).road_name_short := 'Park';
  location_data.road_endings('US')(17).road_name_full := 'Parkway';
  location_data.road_endings('US')(17).road_name_short := 'Pkwy';
  location_data.road_endings('US')(18).road_name_full := 'Pass';
  location_data.road_endings('US')(18).road_name_short := 'Pass';
  location_data.road_endings('US')(19).road_name_full := 'Path';
  location_data.road_endings('US')(19).road_name_short := 'Path';
  location_data.road_endings('US')(20).road_name_full := 'Pike';
  location_data.road_endings('US')(20).road_name_short := 'Pike';
  location_data.road_endings('US')(21).road_name_full := 'Pass';
  location_data.road_endings('US')(21).road_name_short := 'Pass';
  location_data.road_endings('US')(22).road_name_full := 'Place';
  location_data.road_endings('US')(22).road_name_short := 'Pl';
  location_data.road_endings('US')(23).road_name_full := 'Plaza';
  location_data.road_endings('US')(23).road_name_short := 'Plz';
  location_data.road_endings('US')(24).road_name_full := 'Point';
  location_data.road_endings('US')(24).road_name_short := 'Pt';
  location_data.road_endings('US')(25).road_name_full := 'Ridge';
  location_data.road_endings('US')(25).road_name_short := 'Rdg';
  location_data.road_endings('US')(26).road_name_full := 'River';
  location_data.road_endings('US')(26).road_name_short := 'Riv';
  location_data.road_endings('US')(27).road_name_full := 'Road';
  location_data.road_endings('US')(27).road_name_short := 'Rd';
  location_data.road_endings('US')(28).road_name_full := 'Square';
  location_data.road_endings('US')(28).road_name_short := 'Sq';
  location_data.road_endings('US')(29).road_name_full := 'Street';
  location_data.road_endings('US')(29).road_name_short := 'St';
  location_data.road_endings('US')(30).road_name_full := 'Terrace';
  location_data.road_endings('US')(30).road_name_short := 'Ter';
  location_data.road_endings('US')(31).road_name_full := 'Trail';
  location_data.road_endings('US')(31).road_name_short := 'Trl';
  location_data.road_endings('US')(32).road_name_full := 'Turnpike';
  location_data.road_endings('US')(32).road_name_short := 'Tpke';
  location_data.road_endings('US')(33).road_name_full := 'View';
  location_data.road_endings('US')(33).road_name_short := 'Vw';
  location_data.road_endings('US')(34).road_name_full := 'Way';
  location_data.road_endings('US')(34).road_name_short := 'Way';

  -- US states data
  location_data.states('US')(1).state_name := 'Alabama';
  location_data.states('US')(1).state_short := 'AL';
  location_data.states('US')(1).state_capital := 'Montgomery';
  location_data.states('US')(1).cities := 'Birmingham,Montgomery,Mobile,Huntsville,Tuscaloosa,Hoover,Dothan,Decatur,Auburn,Madison,Florence,Gadsden,Vestavia Hills,Prattville,Phenix City,Alabaster,Bessemer';
  location_data.states('US')(2).state_name := 'Alaska';
  location_data.states('US')(2).state_short := 'AK';
  location_data.states('US')(2).state_capital := 'Juneau';
  location_data.states('US')(2).cities := 'Anchorage,Juneau,Fairbanks,Sitka,Ketchikan,Kenai,Kodiak,Bethel,Wasilla,Barrow,Palmer,Unalaska,Valdez,Homer,Soldotna,Nome,Kotzebue,Seward,Dillingham,Cordova,Wrangell,North Pole,Craig';
  location_data.states('US')(3).state_name := 'Arizona';
  location_data.states('US')(3).state_short := 'AZ';
  location_data.states('US')(3).state_capital := 'Phoenix';
  location_data.states('US')(3).cities := 'Phoenix,Tucson,Mesa,Chandler,Glendale,Scottsdale,Gilbert,Tempe,Peoria,Surprise,Yuma,Avondale,Flagstaff,Goodyear,Lake Havasu City,Buckeye,Casa Grande,Sierra Vista,Maricopa,Oro Valley,Prescott,Bullhead City';
  location_data.states('US')(4).state_name := 'Arkansas';
  location_data.states('US')(4).state_short := 'AR';
  location_data.states('US')(4).state_capital := 'Little Rock';
  location_data.states('US')(4).cities := 'Little Rock,Fort Smith,Fayetteville,Springdale,Jonesboro,North Little Rock,Conway,Rogers,Pine Bluff,Bentonville,Hot Springs,Benton,Texarkana,Sherwood,Jacksonville,Russellville,Bella Vista,West Memphis,Paragould,Cabot,Searcy,Van Buren,El Dorado';
  location_data.states('US')(5).state_name := 'California';
  location_data.states('US')(5).state_short := 'CA';
  location_data.states('US')(5).state_capital := 'Sacramento';
  location_data.states('US')(5).cities := 'Los Angeles,San Diego,San Jose,San Francisco,Fresno,Sacramento,Long Beach,Oakland,Bakersfield,Anaheim,Santa Ana,Riverside,Stockton,Chula Vista,Fremont,Irvine,San Bernardino,Modesto,Oxnard,Fontana,Moreno Valley,Glendale,Huntington Beach';
  location_data.states('US')(6).state_name := 'Colorado';
  location_data.states('US')(6).state_short := 'CO';
  location_data.states('US')(6).state_capital := 'Denver';
  location_data.states('US')(6).cities := 'Denver,Colorado Springs,Aurora,Fort Collins,Lakewood,Thornton,Arvada,Westminster,Pueblo,Centennial,Boulder,Greeley,Longmont,Loveland,Broomfield';
  location_data.states('US')(7).state_name := 'Connecticut';
  location_data.states('US')(7).state_short := 'CT';
  location_data.states('US')(7).state_capital := 'Hartford';
  location_data.states('US')(7).cities := 'Bridgeport,New Haven,Hartford,Stamford,Waterbury,Norwalk,Danbury,New Britain,Bristol,Meriden,Milford,West Haven,Middletown,Norwich,Shelton,Torrington,New London,Ansonia,Derby,Groton,Winsted';
  location_data.states('US')(8).state_name := 'Delaware';
  location_data.states('US')(8).state_short := 'DE';
  location_data.states('US')(8).state_capital := 'Dover';
  location_data.states('US')(8).cities := 'Wilmington City,Dover,Newark,Middletown,Smyrna,Milford,Seaford,Georgetown,Elsmere,New Castle,Millsboro,Laurel,Harrington,Camden,Clayton,Lewes,Milton,Selbyville,Bridgeville,Townsend,Ocean View,Delaware City';
  location_data.states('US')(9).state_name := 'Florida';
  location_data.states('US')(9).state_short := 'FL';
  location_data.states('US')(9).state_capital := 'Tallahassee';
  location_data.states('US')(9).cities := 'Jacksonville,Miami,Tampa,Orlando,St. Petersburg,Hialeah,Tallahassee,Fort Lauderdale,Port St. Lucie,Cape Coral,Pembroke Pines,Hollywood,Miramar,Gainesville,Coral Springs,Miami Gardens,Clearwater,Palm Bay,Pompano Beach,West Palm Beach,Lakeland,Davie,Miami Beach';
  location_data.states('US')(10).state_name := 'Georgia';
  location_data.states('US')(10).state_short := 'GA';
  location_data.states('US')(10).state_capital := 'Atlanta';
  location_data.states('US')(10).cities := 'Atlanta,Augusta,Columbus,Savannah,Athens,Sandy Springs,Roswell,Albany,Johns Creek ,Warner Robins,Alpharetta,Marietta,Valdosta,Smyrna,Dunwoody,Rome,Peachtree City,Gainesville,East Point,Hinesville';
  location_data.states('US')(11).state_name := 'Hawaii';
  location_data.states('US')(11).state_short := 'HI';
  location_data.states('US')(11).state_capital := 'Honolulu';
  location_data.states('US')(11).cities := 'Honolulu,East Honolulu,Pearl City,Hilo,Kailua,Waipahu,Kaneohe,Mililani Town,Kahului,Ewa Gentry,Mililani Mauka,Kihei,Makakilo,Wahiawa,Schofield Barracks,Wailuku,Kapolei,Ewa Beach,Royal Kunia,Halawa,Waimalu,Waianae,Nanakuli';
  location_data.states('US')(12).state_name := 'Idaho';
  location_data.states('US')(12).state_short := 'ID';
  location_data.states('US')(12).state_capital := 'Boise';
  location_data.states('US')(12).cities := 'Boise,Meridian,Nampa,Idaho Falls,Pocatello,Caldwell,Coeur d''Alene,Twin Falls,Lewiston,Post Falls,Rexburg,Moscow,Eagle,Kuna,Ammon,Chubbuck,Hayden,Mountain Home,Blackfoot,Garden City,Jerome,Burley,Hailey';
  location_data.states('US')(13).state_name := 'Illinois';
  location_data.states('US')(13).state_short := 'IL';
  location_data.states('US')(13).state_capital := 'Springfield';
  location_data.states('US')(13).cities := 'Chicago,Aurora,Rockford,Joliet,Naperville,Springfield,Peoria,Elgin,Waukegan,Champaign,Bloomington,Decatur,Evanston,Des Plaines,Berwyn,Wheaton';
  location_data.states('US')(14).state_name := 'Indiana';
  location_data.states('US')(14).state_short := 'IN';
  location_data.states('US')(14).state_capital := 'Indianapolis';
  location_data.states('US')(14).cities := 'Indianapolis,Fort Wayne,Evansville,South Bend,Carmel,Fishers,Bloomington,Hammond,Gary,Lafayette,Muncie,Terre Haute,Kokomo,Noblesville,Anderson,Greenwood,Elkhart,Mishawaka,Lawrence,Jeffersonville,Columbus,Portage,New Albany';
  location_data.states('US')(15).state_name := 'Iowa';
  location_data.states('US')(15).state_short := 'IA';
  location_data.states('US')(15).state_capital := 'Des Moines';
  location_data.states('US')(15).cities := 'Des Moines,Cedar Rapids,Davenport,Sioux City,Waterloo,Iowa City,Council Bluffs,Ames,Dubuque,West Des Moines,Ankeny,Urbandale,Cedar Falls,Marion,Bettendorf,Mason City,Marshalltown,Clinton,Burlington';
  location_data.states('US')(16).state_name := 'Kansas';
  location_data.states('US')(16).state_short := 'KS';
  location_data.states('US')(16).state_capital := 'Topeka';
  location_data.states('US')(16).cities := 'Wichita,Overland Park,Kansas City,Olathe,Topeka,Lawrence,Shawnee,Manhattan,Lenexa,Salina,Hutchinson,Leavenworth,Leawood,Dodge City,Garden City,Junction City,Emporia,Derby,Prairie Village,Hays,Liberal,Gardner,Pittsburg';
  location_data.states('US')(17).state_name := 'Kentucky';
  location_data.states('US')(17).state_short := 'KY';
  location_data.states('US')(17).state_capital := 'Frankfort';
  location_data.states('US')(17).cities := 'Louisville,Lexington,Bowling Green,Owensboro,Covington,Hopkinsville,Richmond,Florence,Georgetown,Henderson,Elizabethtown,Nicholasville,Jeffersontown,Frankfort,Paducah,Independence,Radcliff,Ashland,Madisonville,Winchester,Erlanger,Murray';
  location_data.states('US')(18).state_name := 'Louisiana';
  location_data.states('US')(18).state_short := 'LA';
  location_data.states('US')(18).state_capital := 'Baton Rouge';
  location_data.states('US')(18).cities := 'New Orleans,Baton Rouge,Shreveport,Lafayette,Lake Charles,Kenner,Bossier City,Monroe,Alexandria,Houma,New Iberia,Slidell,Central,Ruston,Sulphur,Hammond,Natchitoches,Gretna,Opelousas,Zachary,Thibodaux,Pineville,Baker,Crowley,Minden';
  location_data.states('US')(19).state_name := 'Maine';
  location_data.states('US')(19).state_short := 'ME';
  location_data.states('US')(19).state_capital := 'Augusta';
  location_data.states('US')(19).cities := 'Portland,Lewiston,Bangor,South Portland,Auburn,Biddeford,Sanford,Saco,Augusta,Westbrook,Waterville,Presque Isle,Brewer,Bath,Caribou,Ellsworth,Old Town,Rockland,Belfast,Gardiner,Calais,Hallowell,Eastport';
  location_data.states('US')(20).state_name := 'Maryland';
  location_data.states('US')(20).state_short := 'MD';
  location_data.states('US')(20).state_capital := 'Annapolis';
  location_data.states('US')(20).cities := 'Baltimore,Frederick,Rockville,Gaithersburg,Bowie,Hagerstown,Annapolis,College Park,Salisbury,Laurel,Greenbelt,Cumberland,Westminster,Hyattsville,Takoma Park,Easton,Elkton,Aberdeen,Havre de Grace,Cambridge,New Carrollton,Bel Air,Mount Airy,Bladensburg';
  location_data.states('US')(21).state_name := 'Massachusetts';
  location_data.states('US')(21).state_short := 'MA';
  location_data.states('US')(21).state_capital := 'Boston';
  location_data.states('US')(21).cities := 'Boston,Worcester,Springfield,Lowell,Cambridge,New Bedford,Brockton,Quincy,Lynn,Fall River,Newton,Lawrence,Somerville,Framingham,Haverhill,Waltham,Malden,Brookline,Plymouth,Medford,Taunton';
  location_data.states('US')(22).state_name := 'Michigan';
  location_data.states('US')(22).state_short := 'MI';
  location_data.states('US')(22).state_capital := 'Lansing';
  location_data.states('US')(22).cities := 'Detroit,Grand Rapids,Warren,Sterling Heights,Lansing,Ann Arbor,Flint,Dearborn,Livonia,Clinton Charter Township,Canton Charter Township,Westland,Troy,Farmington Hills,Macomb Township,Kalamazoo,Shelby Charter Township,Wyoming,Southfield,Waterford Charter Township,Rochester Hills,West Bloomfield Charter Township,Taylor,Saint Clair Shores,Pontiac';
  location_data.states('US')(23).state_name := 'Minnesota';
  location_data.states('US')(23).state_short := 'MN';
  location_data.states('US')(23).state_capital := 'St. Paul';
  location_data.states('US')(23).cities := 'Minneapolis,Saint Paul,Rochester,Bloomington,Duluth,Brooklyn Park,Plymouth,Maple Grove,Woodbury,St. Cloud,Eagan,Eden Prairie,Coon Rapids,Blaine,Burnsville,Lakeville,Minnetonka,Apple Valley,Edina,St. Louis Park,Moorhead,Mankato,Maplewood';
  location_data.states('US')(24).state_name := 'Mississippi';
  location_data.states('US')(24).state_short := 'MS';
  location_data.states('US')(24).state_capital := 'Jackson';
  location_data.states('US')(24).cities := 'Jackson,Gulfport,Southaven,Hattiesburg,Biloxi,Meridian,Tupelo,Greenville,Olive Branch,Horn Lake,Clinton,Pearl,Madison,Ridgeland,Starkville,Vicksburg,Columbus,Pascagoula,Brandon,Oxford,Gautier,Laurel,Clarksdale,Ocean Springs,Natchez';
  location_data.states('US')(25).state_name := 'Missouri';
  location_data.states('US')(25).state_short := 'MO';
  location_data.states('US')(25).state_capital := 'Jefferson City';
  location_data.states('US')(25).cities := 'Kansas City,St. Louis,Springfield,Independence,Columbia,Lee''s Summit,O''Fallon,St. Joseph,St. Charles,St. Peters,Blue Springs,Florissant,Joplin,Chesterfield,Jefferson City,Cape Girardeau,Wildwood,University City,Wentzville,Ballwin,Liberty,Raytown,Kirkwood';
  location_data.states('US')(26).state_name := 'Montana';
  location_data.states('US')(26).state_short := 'MT';
  location_data.states('US')(26).state_capital := 'Helena';
  location_data.states('US')(26).cities := 'Billings,Missoula,Great Falls,Bozeman,Butte,Helena,Kalispell,Havre,Anaconda,Miles City,Belgrade,Livingston,Laurel,Whitefish,Lewistown,Sidney,Glendive,Columbia Falls,Polson,Hamilton,Dillon,Hardin';
  location_data.states('US')(27).state_name := 'Nebraska';
  location_data.states('US')(27).state_short := 'NE';
  location_data.states('US')(27).state_capital := 'Lincoln';
  location_data.states('US')(27).cities := 'Omaha,Lincoln,Bellevue,Grand Island,Kearney,Fremont,Hastings,North Platte,Norfolk,Columbus,Papillion,La Vista,Scottsbluff,South Sioux City,Beatrice,Lexington,Alliance,Gering,Blair,York,McCook,Nebraska City,Ralston';
  location_data.states('US')(28).state_name := 'Nevada';
  location_data.states('US')(28).state_short := 'NV';
  location_data.states('US')(28).state_capital := 'Carson City';
  location_data.states('US')(28).cities := 'Boulder City,Caliente,Carlin,Carson City,Elko,Ely,Fallon,Fernley,Henderson,Las Vegas,Lovelock,Mesquite,North Las Vegas,Reno,Sparks,Wells,West Wendover,Winnemucca,Yerington';
  location_data.states('US')(29).state_name := 'New Hampshire';
  location_data.states('US')(29).state_short := 'NH';
  location_data.states('US')(29).state_capital := 'Concord';
  location_data.states('US')(29).cities := 'Manchester,Nashua,Concord,Derry,Dover,Rochester,Salem,Merrimack,Hudson,Londonderry,Keene,Bedford,Portsmouth,Goffstown,Laconia,Hampton,Milford,Durham,Exeter,Windham';
  location_data.states('US')(30).state_name := 'New Jersey';
  location_data.states('US')(30).state_short := 'NJ';
  location_data.states('US')(30).state_capital := 'Trenton';
  location_data.states('US')(30).cities := 'Toms River,Lakewood,Old Bridge,Somerset,Woodbridge,Iselin,Colonia,Avenel,Ocean Acres,Williamstown,Fords,Springdale,Moorestown-Lenola,Bradley Gardens,Cherry Hill Mall,Princeton Meadows,West Freehold,Franklin Park,Mercerville,Short Hills,Holiday City-Berkeley,Hamilton Square,Martinsville,Pennsville,Upper Montclair';
  location_data.states('US')(31).state_name := 'New Mexico';
  location_data.states('US')(31).state_short := 'NM';
  location_data.states('US')(31).state_capital := 'Santa Fe';
  location_data.states('US')(31).cities := 'Albuquerque,Las Cruces,Rio Rancho,Santa Fe,Roswell,Farmington,South Valley,Clovis,Hobbs,Alamogordo,Carlsbad,Gallup,Deming,Los Lunas,Chaparral,Sunland Park,Las Vegas,Portales,Los Alamos,North Valley,Artesia,Lovington,Silver City';
  location_data.states('US')(32).state_name := 'New York';
  location_data.states('US')(32).state_short := 'NY';
  location_data.states('US')(32).state_capital := 'Albany';
  location_data.states('US')(32).cities := 'New York,Buffalo,Rochester,Yonkers,Syracuse,Albany,New Rochelle,Mount Vernon,Schenectady,Utica,White Plains,Troy,Niagara Falls,Binghamton,Rome,Long Beach,Poughkeepsie,North Tonawanda,Jamestown,Ithaca,Elmira,Newburgh,Middletown,Auburn';
  location_data.states('US')(33).state_name := 'North Carolina';
  location_data.states('US')(33).state_short := 'NC';
  location_data.states('US')(33).state_capital := 'Raleigh';
  location_data.states('US')(33).cities := 'Charlotte,Raleigh,Greensboro,Durham,Winston-Salem,Fayetteville,Cary,Wilmington,High Point,Greenville,Asheville,Concord,Gastonia,Jacksonville,Chapel Hill,Rocky Mount,Huntersville,Burlington,Wilson,Kannapolis,Apex,Hickory,Wake Forest';
  location_data.states('US')(34).state_name := 'North Dakota';
  location_data.states('US')(34).state_short := 'ND';
  location_data.states('US')(34).state_capital := 'Bismarck';
  location_data.states('US')(34).cities := 'Fargo,Bismarck,Grand Forks,Minot,West Fargo,Williston,Dickinson,Mandan,Jamestown,Wahpeton,Devils Lake,Watford City,Valley City,Grafton,Lincoln,Beulah,Rugby,Stanley,Horace,Casselton,New Town,Hazen,Bottineau';
  location_data.states('US')(35).state_name := 'Ohio';
  location_data.states('US')(35).state_short := 'OH';
  location_data.states('US')(35).state_capital := 'Columbus';
  location_data.states('US')(35).cities := 'Columbus,Cleveland,Cincinnati,Toledo,Akron,Dayton,Parma,Canton,Youngstown,Lorain,Hamilton,Springfield,Kettering,Elyria,Lakewood,Cuyahoga Falls,Euclid,Middletown,Mansfield,Newark,Mentor,Cleveland Heights,Beavercreek';
  location_data.states('US')(36).state_name := 'Oklahoma';
  location_data.states('US')(36).state_short := 'OK';
  location_data.states('US')(36).state_capital := 'Oklahoma City';
  location_data.states('US')(36).cities := 'Oklahoma City,Tulsa,Norman,Broken Arrow,Lawton,Edmond,Moore,Midwest City,Enid,Stillwater,Muskogee,Bartlesville,Owasso,Shawnee,Yukon,Ardmore,Ponca City,Bixby,Duncan,Del City,Jenks,Sapulpa,Mustang';
  location_data.states('US')(37).state_name := 'Oregon';
  location_data.states('US')(37).state_short := 'OR';
  location_data.states('US')(37).state_capital := 'Salem';
  location_data.states('US')(37).cities := 'Ada,Adair Village,Adams,Adel,Adrian,Ady,Agate Beach,Agness,Airlie,Albany,Alder,Alfalfa,Algoma,Alicel,Alma,Allegany,Aloha,Alpine,Alsea,Altamont,Alvadore,Amity,Andrews,Anlauf,Antelope,Antone,Apiary,Applegate';
  location_data.states('US')(38).state_name := 'Pennsylvania';
  location_data.states('US')(38).state_short := 'PA';
  location_data.states('US')(38).state_capital := 'Harrisburg';
  location_data.states('US')(38).cities := 'Philadelphia,Pittsburgh,Allentown,Erie,Reading,Scranton,Bethlehem,Lancaster,Harrisburg,Altoona,York,Wilkes-Barre,Chester,Williamsport,Easton,Lebanon,Hazleton,New Castle,Johnstown,McKeesport,Hermitage,Greensburg,Pottsville';
  location_data.states('US')(39).state_name := 'Rhode Island';
  location_data.states('US')(39).state_short := 'RI';
  location_data.states('US')(39).state_capital := 'Providence';
  location_data.states('US')(39).cities := 'North Providence,West Warwick,Bristol,Westerly,Barrington,Valley Falls,Newport East,Greenville,Wakefield-Peacedale,Cumberland Hill,Tiverton,Kingston,Pascoag,Narragansett Pier,Melville,Hope Valley,Harrisville,Ashaway,Bradford,Carolina,Chepachet';
  location_data.states('US')(40).state_name := 'South Carolina';
  location_data.states('US')(40).state_short := 'SC';
  location_data.states('US')(40).state_capital := 'Columbia';
  location_data.states('US')(40).cities := 'Columbia,Charleston,North Charleston,Mount Pleasant,Rock Hill,Greenville,Summerville,Sumter,Hilton Head Island,Florence,Spartanburg,Goose Creek,Aiken,Myrtle Beach,Anderson,Greer,Greenwood,Mauldin';
  location_data.states('US')(41).state_name := 'South Dakota';
  location_data.states('US')(41).state_short := 'SD';
  location_data.states('US')(41).state_capital := 'Pierre';
  location_data.states('US')(41).cities := 'Sioux Falls,Rapid City,Aberdeen,Brookings,Watertown,Mitchell,Yankton,Pierre,Huron,Vermillion,Spearfish,Brandon,Box Elder,Sturgis,Madison,Belle Fourche,Harrisburg,Tea,Hot Springs,Dell Rapids';
  location_data.states('US')(42).state_name := 'Tennessee';
  location_data.states('US')(42).state_short := 'TN';
  location_data.states('US')(42).state_capital := 'Nashville';
  location_data.states('US')(42).cities := 'Memphis,Nashville,Knoxville,Chattanooga,Clarksville,Murfreesboro,Jackson,Johnson City,Franklin,Bartlett,Hendersonville,Kingsport,Collierville,Cleveland,Smyrna,Germantown,Brentwood,Columbia,La Vergne';
  location_data.states('US')(43).state_name := 'Texas';
  location_data.states('US')(43).state_short := 'TX';
  location_data.states('US')(43).state_capital := 'Austin';
  location_data.states('US')(43).cities := 'Houston,San Antonio,Dallas,Austin,Fort Worth,El Paso,Arlington,Corpus Christi,Plano,Laredo,Lubbock,Garland,Irving,Amarillo,Grand Prairie,Brownsville,Pasadena,McKinney,Mesquite,Killeen,Frisco,McAllen';
  location_data.states('US')(44).state_name := 'Utah';
  location_data.states('US')(44).state_short := 'UT';
  location_data.states('US')(44).state_capital := 'Salt Lake City';
  location_data.states('US')(44).cities := 'Salt Lake City,West Valley City,Provo,West Jordan,Orem,Sandy,Ogden,St. George,Layton,Taylorsville,South Jordan,Logan,Lehi';
  location_data.states('US')(45).state_name := 'Vermont';
  location_data.states('US')(45).state_short := 'VT';
  location_data.states('US')(45).state_capital := 'Montpelier';
  location_data.states('US')(45).cities := 'Burlington,South Burlington,Rutland,Barre,Montpelier,Winooski,St. Albans,Newport,Vergennes';
  location_data.states('US')(46).state_name := 'Virginia';
  location_data.states('US')(46).state_short := 'VA';
  location_data.states('US')(46).state_capital := 'Richmond';
  location_data.states('US')(46).cities := 'Virginia Beach,Norfolk,Chesapeake,Richmond,Newport News,Alexandria,Hampton,Roanoke,Portsmouth,Suffolk,Lynchburg,Harrisonburg,Charlottesville,Danville,Manassas,Petersburg,Fredericksburg,Winchester,Salem,Staunton,Fairfax,Hopewell,Waynesboro';
  location_data.states('US')(47).state_name := 'Washington';
  location_data.states('US')(47).state_short := 'WA';
  location_data.states('US')(47).state_capital := 'Olympia';
  location_data.states('US')(47).cities := 'Seattle,Spokane,Tacoma,Vancouver,Bellevue,Kent,Everett,Renton,Federal Way,Yakima,Spokane Valley,Kirkland,Bellingham,Kennewick,Auburn,Pasco,Marysville,Lakewood,Redmond,Shoreline,Richland,Sammamish,Burien';
  location_data.states('US')(48).state_name := 'West Virginia';
  location_data.states('US')(48).state_short := 'WV';
  location_data.states('US')(48).state_capital := 'Charleston';
  location_data.states('US')(48).cities := 'Charleston,Huntington,Morgantown,Parkersburg,Wheeling,Weirton,Fairmont,Martinsburg,Beckley,Clarksburg,South Charleston,St. Albans,Vienna,Bluefield,Moundsville,Bridgeport,Oak Hill,Dunbar,Elkins,Nitro,Hurricane,Princeton,Charles Town';
  location_data.states('US')(49).state_name := 'Wisconsin';
  location_data.states('US')(49).state_short := 'WI';
  location_data.states('US')(49).state_capital := 'Madison';
  location_data.states('US')(49).cities := 'Milwaukee,Madison,Green Bay,Kenosha,Racine,Appleton,Waukesha,Oshkosh,Eau Claire,Janesville,West Allis,La Crosse,Sheboygan,Wauwatosa,Fond du Lac,New Berlin,Wausau,Brookfield,Beloit';
  location_data.states('US')(50).state_name := 'Wyoming';
  location_data.states('US')(50).state_short := 'WY';
  location_data.states('US')(50).state_capital := 'Cheyenne';
  location_data.states('US')(50).cities := 'Cheyenne,Casper,Laramie,Gillette,Rock Springs,Sheridan,Green River,Evanston,Riverton,Jackson,Cody,Rawlins,Lander,Torrington,Powell,Douglas,Worland,Buffalo,Wheatland,Newcastle,Mills,Thermopolis,Kemmerer';

end location_data_us;
/
