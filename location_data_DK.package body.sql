create or replace package body location_data_dk

as

begin

  dbms_application_info.set_client_info('location_data_dk');
  dbms_session.set_identifier('location_data_dk');

  -- Init arrays
  location_data.states('DK') := location_data.state_list(null);
  location_data.states('DK').extend(5);
  location_data.road_endings('DK') := location_data.road_list(null);
  location_data.road_endings('DK').extend(7);
  location_data.second_addresses('DK') := location_data.address2_list(null);
  location_data.second_addresses('DK').extend(6);

  -- Address 2 names.
  location_data.second_addresses('DK')(1) := '1 th.';
  location_data.second_addresses('DK')(2) := '3 tv.';
  location_data.second_addresses('DK')(3) := '2 mf.';
  location_data.second_addresses('DK')(4) := '3 th.';
  location_data.second_addresses('DK')(5) := '2 tv.';
  location_data.second_addresses('DK')(6) := '1 tv.';

  -- Road names
  location_data.road_endings('DK')(1).road_name_full := 'vej';
  location_data.road_endings('DK')(1).road_name_short := 'vej';
  location_data.road_endings('DK')(1).road_name_ext := 'Y';
  location_data.road_endings('DK')(2).road_name_full := 'gade';
  location_data.road_endings('DK')(2).road_name_short := 'gade';
  location_data.road_endings('DK')(2).road_name_ext := 'Y';
  location_data.road_endings('DK')(3).road_name_full := 'stræde';
  location_data.road_endings('DK')(3).road_name_short := 'stræde';
  location_data.road_endings('DK')(3).road_name_ext := 'Y';
  location_data.road_endings('DK')(4).road_name_full := 'gården';
  location_data.road_endings('DK')(4).road_name_short := 'gården';
  location_data.road_endings('DK')(4).road_name_ext := 'Y';
  location_data.road_endings('DK')(5).road_name_full := 'Brygge';
  location_data.road_endings('DK')(5).road_name_short := 'Brygge';
  location_data.road_endings('DK')(6).road_name_full := 'Allé';
  location_data.road_endings('DK')(6).road_name_short := 'Allé';
  location_data.road_endings('DK')(7).road_name_full := 'Plads';
  location_data.road_endings('DK')(7).road_name_short := 'Plads';

  -- DK states (Regioner)
  location_data.states('DK')(1).state_name := 'Nordjylland';
  location_data.states('DK')(1).state_short := 'RN';
  location_data.states('DK')(1).state_capital := 'Aalborg';
  location_data.states('DK')(1).cities := 'Hjørring,Frederikshavn,Nørresundby,Thisted,Brønderslev,Hobro,Nykøbing Mors,Sæby,Skagen,Aars,Svenstrup,Støvring,Hirtshals,Aabybro,Nibe,Hadsund,Klarup,Vodskov,Løgstør';
  location_data.states('DK')(2).state_name := 'Midtjylland';
  location_data.states('DK')(2).state_short := 'RM';
  location_data.states('DK')(2).state_capital := 'Viborg';
  location_data.states('DK')(2).cities := 'Hadsten,Ulstrup,Hammel,Hedensted,Herning,Holstebro,Horsens,Ikast,Brande,Lemvig,Odder,Randers,Ringkøbing,Silkeborg,Skanderborg,Struer,Skive,Viborg,Aarhus';
  location_data.states('DK')(3).state_name := 'Syddanmark';
  location_data.states('DK')(3).state_short := 'RS';
  location_data.states('DK')(3).state_capital := 'Vejle';
  location_data.states('DK')(3).cities := 'Assens,Billund,Esbjerg,Fanø,Fredericia,Faaborg,Haderslev,Kerteminde,Kolding,Middelfart,Nyborg,Odense,Svendborg,Sønderborg,Tønder,Varde,Vejen,Aabenraa';
  location_data.states('DK')(4).state_name := 'Sjælland';
  location_data.states('DK')(4).state_short := 'RSJ';
  location_data.states('DK')(4).state_capital := 'Sorø';
  location_data.states('DK')(4).cities := 'Faxe,Greve,Guldborgsund,Holbæk,Kalundborg,Køge,Lejre,Næstved,Ringsted,Roskilde,Slagelse,Solrød,Stevns,Vordingborg';
  location_data.states('DK')(5).state_name := 'Hovedstaden';
  location_data.states('DK')(5).state_short := 'RH';
  location_data.states('DK')(5).state_capital := 'København';
  location_data.states('DK')(5).cities := 'Albertslund,Allerød,Ballerup,Brøndby,Dragør,Fredensborg,Frederiksberg,Frederikssund,Gentofte,Gladsaxe,Glostrup,Gribskov,Helsingør,Herlev,Hillerød,Hvidovre,Høje-Taastrup,Hørsholm,Ishøj,Lyngby,Rudersdal,Rødovre,Tårnby,Vallensbæk';

end location_data_dk;
/
