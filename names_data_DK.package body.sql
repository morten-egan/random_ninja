create or replace package body names_data_dk

as

begin

  dbms_application_info.set_client_info('names_data_dk');
  dbms_session.set_identifier('names_data_dk');

  -- Init the DK collection.
  names_data.r_country_names('DK').male_first_names := names_data.name_list(null);
  names_data.r_country_names('DK').male_middle_names := names_data.name_list(null);
  names_data.r_country_names('DK').female_first_names := names_data.name_list(null);
  names_data.r_country_names('DK').female_middle_names := names_data.name_list(null);
  names_data.r_country_names('DK').last_names := names_data.name_list(null);
  names_data.r_country_names('DK').male_first_names.extend(101);
  names_data.r_country_names('DK').male_middle_names.extend(50);
  names_data.r_country_names('DK').female_first_names.extend(100);
  names_data.r_country_names('DK').female_middle_names.extend(50);
  names_data.r_country_names('DK').last_names.extend(100);

  -- DK prefixes
  names_data.r_country_names('DK').male_prefix := 'Hr.';
  names_data.r_country_names('DK').female_prefix := 'Fru,Frk.';
  names_data.r_country_names('DK').all_prefix := 'Dr.';

  -- DK suffixes
  names_data.r_country_names('DK').suffix_full := 'I,II,III,IV';
  names_data.r_country_names('DK').suffix_short := 'I,II,III,IV';

  -- DK drenge fornavne.
  names_data.r_country_names('DK').male_first_names(1) :=	'William';
  names_data.r_country_names('DK').male_first_names(2) :=	'Noah';
  names_data.r_country_names('DK').male_first_names(3) :=	'Emil';
  names_data.r_country_names('DK').male_first_names(4) :=	'Frederik';
  names_data.r_country_names('DK').male_first_names(5) :=	'Oliver';
  names_data.r_country_names('DK').male_first_names(6) :=	'Magnus';
  names_data.r_country_names('DK').male_first_names(7) :=	'Elias';
  names_data.r_country_names('DK').male_first_names(8) :=	'Anton';
  names_data.r_country_names('DK').male_first_names(9) :=	'Alfred';
  names_data.r_country_names('DK').male_first_names(10) :=	'Alexander';
  names_data.r_country_names('DK').male_first_names(11) :=	'Malthe';
  names_data.r_country_names('DK').male_first_names(12) :=	'Mikkel';
  names_data.r_country_names('DK').male_first_names(13) :=	'Liam';
  names_data.r_country_names('DK').male_first_names(14) :=	'August';
  names_data.r_country_names('DK').male_first_names(15) :=	'Valdemar';
  names_data.r_country_names('DK').male_first_names(16) :=	'Lucas';
  names_data.r_country_names('DK').male_first_names(17) :=	'Felix';
  names_data.r_country_names('DK').male_first_names(18) :=	'Victor';
  names_data.r_country_names('DK').male_first_names(19) :=	'Mads';
  names_data.r_country_names('DK').male_first_names(20) :=	'Villads';
  names_data.r_country_names('DK').male_first_names(21) :=	'Benjamin';
  names_data.r_country_names('DK').male_first_names(22) :=	'Mathias';
  names_data.r_country_names('DK').male_first_names(23) :=	'Johan';
  names_data.r_country_names('DK').male_first_names(24) :=	'Sebastian';
  names_data.r_country_names('DK').male_first_names(25) :=	'Oscar';
  names_data.r_country_names('DK').male_first_names(26) :=	'Marius';
  names_data.r_country_names('DK').male_first_names(27) :=	'Christian';
  names_data.r_country_names('DK').male_first_names(28) :=	'Carl';
  names_data.r_country_names('DK').male_first_names(29) :=	'Oskar';
  names_data.r_country_names('DK').male_first_names(30) :=	'Storm';
  names_data.r_country_names('DK').male_first_names(31) :=	'Adam';
  names_data.r_country_names('DK').male_first_names(32) :=	'Tobias';
  names_data.r_country_names('DK').male_first_names(33) :=	'Lukas';
  names_data.r_country_names('DK').male_first_names(34) :=	'Aksel';
  names_data.r_country_names('DK').male_first_names(35) :=	'Albert';
  names_data.r_country_names('DK').male_first_names(36) :=	'Viktor';
  names_data.r_country_names('DK').male_first_names(37) :=	'Theodor';
  names_data.r_country_names('DK').male_first_names(38) :=	'Arthur';
  names_data.r_country_names('DK').male_first_names(39) :=	'Elliot';
  names_data.r_country_names('DK').male_first_names(40) :=	'Bertram';
  names_data.r_country_names('DK').male_first_names(41) :=	'Asger';
  names_data.r_country_names('DK').male_first_names(42) :=	'Andreas';
  names_data.r_country_names('DK').male_first_names(43) :=	'Daniel';
  names_data.r_country_names('DK').male_first_names(44) :=	'Jonas';
  names_data.r_country_names('DK').male_first_names(45) :=	'Laurits';
  names_data.r_country_names('DK').male_first_names(46) :=	'Karl';
  names_data.r_country_names('DK').male_first_names(47) :=	'Viggo';
  names_data.r_country_names('DK').male_first_names(48) :=	'David';
  names_data.r_country_names('DK').male_first_names(49) :=	'Jonathan';
  names_data.r_country_names('DK').male_first_names(50) :=	'Thor';
  names_data.r_country_names('DK').male_first_names(51) :=	'Tristan';
  names_data.r_country_names('DK').male_first_names(52) :=	'Johannes';
  names_data.r_country_names('DK').male_first_names(53) :=	'Villum';
  names_data.r_country_names('DK').male_first_names(54) :=	'Otto';
  names_data.r_country_names('DK').male_first_names(55) :=	'Simon';
  names_data.r_country_names('DK').male_first_names(56) :=	'Theo';
  names_data.r_country_names('DK').male_first_names(57) :=	'Malte';
  names_data.r_country_names('DK').male_first_names(58) :=	'Jeppe';
  names_data.r_country_names('DK').male_first_names(59) :=	'Marcus';
  names_data.r_country_names('DK').male_first_names(60) :=	'Sigurd';
  names_data.r_country_names('DK').male_first_names(61) :=	'Lauge';
  names_data.r_country_names('DK').male_first_names(62) :=	'Silas';
  names_data.r_country_names('DK').male_first_names(63) :=	'Julius';
  names_data.r_country_names('DK').male_first_names(64) :=	'Magne';
  names_data.r_country_names('DK').male_first_names(65) :=	'Hjalte';
  names_data.r_country_names('DK').male_first_names(66) :=	'Rasmus';
  names_data.r_country_names('DK').male_first_names(67) :=	'Bastian';
  names_data.r_country_names('DK').male_first_names(68) :=	'Ludvig';
  names_data.r_country_names('DK').male_first_names(69) :=	'Milas';
  names_data.r_country_names('DK').male_first_names(70) :=	'Jacob';
  names_data.r_country_names('DK').male_first_names(71) :=	'Nohr';
  names_data.r_country_names('DK').male_first_names(72) :=	'Erik';
  names_data.r_country_names('DK').male_first_names(73) :=	'Gabriel';
  names_data.r_country_names('DK').male_first_names(74) :=	'Hugo';
  names_data.r_country_names('DK').male_first_names(75) :=	'Jakob';
  names_data.r_country_names('DK').male_first_names(76) :=	'Axel';
  names_data.r_country_names('DK').male_first_names(77) :=	'Nor';
  names_data.r_country_names('DK').male_first_names(78) :=	'Max';
  names_data.r_country_names('DK').male_first_names(79) :=	'Vincent';
  names_data.r_country_names('DK').male_first_names(80) :=	'Charlie';
  names_data.r_country_names('DK').male_first_names(81) :=	'Philip';
  names_data.r_country_names('DK').male_first_names(82) :=	'Samuel';
  names_data.r_country_names('DK').male_first_names(83) :=	'Sander';
  names_data.r_country_names('DK').male_first_names(84) :=	'Lasse';
  names_data.r_country_names('DK').male_first_names(85) :=	'Milo';
  names_data.r_country_names('DK').male_first_names(86) :=	'Birk';
  names_data.r_country_names('DK').male_first_names(87) :=	'Sofus';
  names_data.r_country_names('DK').male_first_names(88) :=	'Vitus';
  names_data.r_country_names('DK').male_first_names(89) :=	'Adrian';
  names_data.r_country_names('DK').male_first_names(90) :=	'Bjørn';
  names_data.r_country_names('DK').male_first_names(91) :=	'Konrad';
  names_data.r_country_names('DK').male_first_names(92) :=	'Kristian';
  names_data.r_country_names('DK').male_first_names(93) :=	'Nikolaj';
  names_data.r_country_names('DK').male_first_names(94) :=	'Thomas';
  names_data.r_country_names('DK').male_first_names(95) :=	'Sylvester';
  names_data.r_country_names('DK').male_first_names(96) :=	'Malik';
  names_data.r_country_names('DK').male_first_names(97) :=	'Nicklas';
  names_data.r_country_names('DK').male_first_names(98) :=	'Pelle';
  names_data.r_country_names('DK').male_first_names(99) :=	'Jens';
  names_data.r_country_names('DK').male_first_names(100) :=	'Louis';
  names_data.r_country_names('DK').male_first_names(100) :=	'Castor';

  -- DK Pige fornavne.
  names_data.r_country_names('DK').female_first_names(1) := 'Emma';
  names_data.r_country_names('DK').female_first_names(2) := 'Ida';
  names_data.r_country_names('DK').female_first_names(3) := 'Laura';
  names_data.r_country_names('DK').female_first_names(4) := 'Anna';
  names_data.r_country_names('DK').female_first_names(5) := 'Ella';
  names_data.r_country_names('DK').female_first_names(6) := 'Alma';
  names_data.r_country_names('DK').female_first_names(7) := 'Isabella';
  names_data.r_country_names('DK').female_first_names(8) := 'Freja';
  names_data.r_country_names('DK').female_first_names(9) := 'Olivia';
  names_data.r_country_names('DK').female_first_names(10) := 'Clara';
  names_data.r_country_names('DK').female_first_names(11) := 'Alberte';
  names_data.r_country_names('DK').female_first_names(12) := 'Agnes';
  names_data.r_country_names('DK').female_first_names(13) := 'Lærke';
  names_data.r_country_names('DK').female_first_names(14) := 'Liva';
  names_data.r_country_names('DK').female_first_names(15) := 'Sofie';
  names_data.r_country_names('DK').female_first_names(16) := 'Sofia';
  names_data.r_country_names('DK').female_first_names(17) := 'Karla';
  names_data.r_country_names('DK').female_first_names(18) := 'Emilie';
  names_data.r_country_names('DK').female_first_names(19) := 'Mille';
  names_data.r_country_names('DK').female_first_names(20) := 'Frida';
  names_data.r_country_names('DK').female_first_names(21) := 'Mathilde';
  names_data.r_country_names('DK').female_first_names(22) := 'Josefine';
  names_data.r_country_names('DK').female_first_names(23) := 'Victoria';
  names_data.r_country_names('DK').female_first_names(24) := 'Marie';
  names_data.r_country_names('DK').female_first_names(25) := 'Maja';
  names_data.r_country_names('DK').female_first_names(26) := 'Ellen';
  names_data.r_country_names('DK').female_first_names(27) := 'Caroline';
  names_data.r_country_names('DK').female_first_names(28) := 'Rosa';
  names_data.r_country_names('DK').female_first_names(29) := 'Sophia';
  names_data.r_country_names('DK').female_first_names(30) := 'Julie';
  names_data.r_country_names('DK').female_first_names(31) := 'Signe';
  names_data.r_country_names('DK').female_first_names(32) := 'Liv';
  names_data.r_country_names('DK').female_first_names(33) := 'Vigga';
  names_data.r_country_names('DK').female_first_names(34) := 'Emily';
  names_data.r_country_names('DK').female_first_names(35) := 'Alba';
  names_data.r_country_names('DK').female_first_names(36) := 'Nora';
  names_data.r_country_names('DK').female_first_names(37) := 'Astrid';
  names_data.r_country_names('DK').female_first_names(38) := 'Filippa';
  names_data.r_country_names('DK').female_first_names(39) := 'Asta';
  names_data.r_country_names('DK').female_first_names(40) := 'Luna';
  names_data.r_country_names('DK').female_first_names(41) := 'Malou';
  names_data.r_country_names('DK').female_first_names(42) := 'Nanna';
  names_data.r_country_names('DK').female_first_names(43) := 'Sara';
  names_data.r_country_names('DK').female_first_names(44) := 'Johanne';
  names_data.r_country_names('DK').female_first_names(45) := 'Lea';
  names_data.r_country_names('DK').female_first_names(46) := 'Andrea';
  names_data.r_country_names('DK').female_first_names(47) := 'Silje';
  names_data.r_country_names('DK').female_first_names(48) := 'Aya';
  names_data.r_country_names('DK').female_first_names(49) := 'Thea';
  names_data.r_country_names('DK').female_first_names(50) := 'Merle';
  names_data.r_country_names('DK').female_first_names(51) := 'Josephine';
  names_data.r_country_names('DK').female_first_names(52) := 'Carla';
  names_data.r_country_names('DK').female_first_names(53) := 'Dicte';
  names_data.r_country_names('DK').female_first_names(54) := 'Selma';
  names_data.r_country_names('DK').female_first_names(55) := 'Esther';
  names_data.r_country_names('DK').female_first_names(56) := 'Silke';
  names_data.r_country_names('DK').female_first_names(57) := 'Dagmar';
  names_data.r_country_names('DK').female_first_names(58) := 'Maya';
  names_data.r_country_names('DK').female_first_names(59) := 'Sarah';
  names_data.r_country_names('DK').female_first_names(60) := 'Eva';
  names_data.r_country_names('DK').female_first_names(61) := 'Gry';
  names_data.r_country_names('DK').female_first_names(62) := 'Vega';
  names_data.r_country_names('DK').female_first_names(63) := 'Emilia';
  names_data.r_country_names('DK').female_first_names(64) := 'Sigrid';
  names_data.r_country_names('DK').female_first_names(65) := 'Augusta';
  names_data.r_country_names('DK').female_first_names(66) := 'Naja';
  names_data.r_country_names('DK').female_first_names(67) := 'Celina';
  names_data.r_country_names('DK').female_first_names(68) := 'Karoline';
  names_data.r_country_names('DK').female_first_names(69) := 'Vera';
  names_data.r_country_names('DK').female_first_names(70) := 'Freya';
  names_data.r_country_names('DK').female_first_names(71) := 'Klara';
  names_data.r_country_names('DK').female_first_names(72) := 'Maria';
  names_data.r_country_names('DK').female_first_names(73) := 'Nova';
  names_data.r_country_names('DK').female_first_names(74) := 'Molly';
  names_data.r_country_names('DK').female_first_names(75) := 'Ingrid';
  names_data.r_country_names('DK').female_first_names(76) := 'Mia';
  names_data.r_country_names('DK').female_first_names(77) := 'Mira';
  names_data.r_country_names('DK').female_first_names(78) := 'Nicoline';
  names_data.r_country_names('DK').female_first_names(79) := 'Tilde';
  names_data.r_country_names('DK').female_first_names(80) := 'Ronja';
  names_data.r_country_names('DK').female_first_names(81) := 'Saga';
  names_data.r_country_names('DK').female_first_names(82) := 'Viola';
  names_data.r_country_names('DK').female_first_names(83) := 'Leonora';
  names_data.r_country_names('DK').female_first_names(84) := 'Cecilie';
  names_data.r_country_names('DK').female_first_names(85) := 'Ea';
  names_data.r_country_names('DK').female_first_names(86) := 'Emmelie';
  names_data.r_country_names('DK').female_first_names(87) := 'Frederikke';
  names_data.r_country_names('DK').female_first_names(88) := 'Matilde';
  names_data.r_country_names('DK').female_first_names(89) := 'Mie';
  names_data.r_country_names('DK').female_first_names(90) := 'Julia';
  names_data.r_country_names('DK').female_first_names(91) := 'Sia';
  names_data.r_country_names('DK').female_first_names(92) := 'Melina';
  names_data.r_country_names('DK').female_first_names(93) := 'Amanda';
  names_data.r_country_names('DK').female_first_names(94) := 'Melanie';
  names_data.r_country_names('DK').female_first_names(95) := 'Hannah';
  names_data.r_country_names('DK').female_first_names(96) := 'Jasmin';
  names_data.r_country_names('DK').female_first_names(97) := 'Nikoline';
  names_data.r_country_names('DK').female_first_names(98) := 'Kaya';
  names_data.r_country_names('DK').female_first_names(99) := 'Sally';
  names_data.r_country_names('DK').female_first_names(100) := 'Thilde';

  -- DK Drenge mellemnavne.
  names_data.r_country_names('DK').male_middle_names(1) := 'Møller';
  names_data.r_country_names('DK').male_middle_names(2) := 'Lund';
  names_data.r_country_names('DK').male_middle_names(3) := 'Holm';
  names_data.r_country_names('DK').male_middle_names(4) := 'Jensen';
  names_data.r_country_names('DK').male_middle_names(5) := 'Juul';
  names_data.r_country_names('DK').male_middle_names(6) := 'Nielsen';
  names_data.r_country_names('DK').male_middle_names(7) := 'Kjær';
  names_data.r_country_names('DK').male_middle_names(8) := 'Hansen';
  names_data.r_country_names('DK').male_middle_names(9) := 'Skov';
  names_data.r_country_names('DK').male_middle_names(10) := 'Østergaard';
  names_data.r_country_names('DK').male_middle_names(11) := 'Vestergaard';
  names_data.r_country_names('DK').male_middle_names(12) := 'Nørgaard';
  names_data.r_country_names('DK').male_middle_names(13) := 'Dahl';
  names_data.r_country_names('DK').male_middle_names(14) := 'Bach';
  names_data.r_country_names('DK').male_middle_names(15) := 'Friis';
  names_data.r_country_names('DK').male_middle_names(16) := 'Søndergaard';
  names_data.r_country_names('DK').male_middle_names(17) := 'Andersen';
  names_data.r_country_names('DK').male_middle_names(18) := 'Bech';
  names_data.r_country_names('DK').male_middle_names(19) := 'Pedersen';
  names_data.r_country_names('DK').male_middle_names(20) := 'Bruun';
  names_data.r_country_names('DK').male_middle_names(21) := 'Nygaard';
  names_data.r_country_names('DK').male_middle_names(22) := 'Winther';
  names_data.r_country_names('DK').male_middle_names(23) := 'Bang';
  names_data.r_country_names('DK').male_middle_names(24) := 'Krogh';
  names_data.r_country_names('DK').male_middle_names(25) := 'Schmidt';
  names_data.r_country_names('DK').male_middle_names(26) := 'Christensen';
  names_data.r_country_names('DK').male_middle_names(27) := 'Hedegaard';
  names_data.r_country_names('DK').male_middle_names(28) := 'Toft';
  names_data.r_country_names('DK').male_middle_names(29) := 'Damgaard';
  names_data.r_country_names('DK').male_middle_names(30) := 'Holst';
  names_data.r_country_names('DK').male_middle_names(31) := 'Sørensen';
  names_data.r_country_names('DK').male_middle_names(32) := 'Juhl';
  names_data.r_country_names('DK').male_middle_names(33) := 'Munk';
  names_data.r_country_names('DK').male_middle_names(34) := 'Søgaard';
  names_data.r_country_names('DK').male_middle_names(35) := 'Aagaard';
  names_data.r_country_names('DK').male_middle_names(36) := 'Berg';
  names_data.r_country_names('DK').male_middle_names(37) := 'Dam';
  names_data.r_country_names('DK').male_middle_names(38) := 'Petersen';
  names_data.r_country_names('DK').male_middle_names(39) := 'Lind';
  names_data.r_country_names('DK').male_middle_names(40) := 'Overgaard';
  names_data.r_country_names('DK').male_middle_names(41) := 'Brandt';
  names_data.r_country_names('DK').male_middle_names(42) := 'Larsen';
  names_data.r_country_names('DK').male_middle_names(43) := 'Bak';
  names_data.r_country_names('DK').male_middle_names(44) := 'Schou';
  names_data.r_country_names('DK').male_middle_names(45) := 'Vinther';
  names_data.r_country_names('DK').male_middle_names(46) := 'Bjerregaard';
  names_data.r_country_names('DK').male_middle_names(47) := 'Riis';
  names_data.r_country_names('DK').male_middle_names(48) := 'Bundgaard';
  names_data.r_country_names('DK').male_middle_names(49) := 'Kruse';
  names_data.r_country_names('DK').male_middle_names(50) := 'Mølgaard';

  -- DK Pige mellemnavne.
  names_data.r_country_names('DK').female_middle_names(1) := 'Bæk';
  names_data.r_country_names('DK').female_middle_names(2) := 'Elkjær';
  names_data.r_country_names('DK').female_middle_names(3) := 'Hartmann';
  names_data.r_country_names('DK').female_middle_names(4) := 'Kirk';
  names_data.r_country_names('DK').female_middle_names(5) := 'Sand';
  names_data.r_country_names('DK').female_middle_names(6) := 'Sommer';
  names_data.r_country_names('DK').female_middle_names(7) := 'Skou';
  names_data.r_country_names('DK').female_middle_names(8) := 'Nedergaard';
  names_data.r_country_names('DK').female_middle_names(9) := 'Meldgaard';
  names_data.r_country_names('DK').female_middle_names(10) := 'Brink';
  names_data.r_country_names('DK').female_middle_names(11) := 'Lindegaard';
  names_data.r_country_names('DK').female_middle_names(12) := 'Fischer';
  names_data.r_country_names('DK').female_middle_names(13) := 'Rye';
  names_data.r_country_names('DK').female_middle_names(14) := 'Hoffmann';
  names_data.r_country_names('DK').female_middle_names(15) := 'Daugaard';
  names_data.r_country_names('DK').female_middle_names(16) := 'Gram';
  names_data.r_country_names('DK').female_middle_names(17) := 'Johansen';
  names_data.r_country_names('DK').female_middle_names(18) := 'Meyer';
  names_data.r_country_names('DK').female_middle_names(19) := 'Schultz';
  names_data.r_country_names('DK').female_middle_names(20) := 'Fogh';
  names_data.r_country_names('DK').female_middle_names(21) := 'Bloch';
  names_data.r_country_names('DK').female_middle_names(22) := 'Lundgaard';
  names_data.r_country_names('DK').female_middle_names(23) := 'Brøndum';
  names_data.r_country_names('DK').female_middle_names(24) := 'Jessen';
  names_data.r_country_names('DK').female_middle_names(25) := 'Busk';
  names_data.r_country_names('DK').female_middle_names(26) := 'Holmgaard';
  names_data.r_country_names('DK').female_middle_names(27) := 'Lindholm';
  names_data.r_country_names('DK').female_middle_names(28) := 'Krog';
  names_data.r_country_names('DK').female_middle_names(29) := 'Egelund';
  names_data.r_country_names('DK').female_middle_names(30) := 'Engelbrecht';
  names_data.r_country_names('DK').female_middle_names(31) := 'Buus';
  names_data.r_country_names('DK').female_middle_names(32) := 'Korsgaard';
  names_data.r_country_names('DK').female_middle_names(33) := 'Ellegaard';
  names_data.r_country_names('DK').female_middle_names(34) := 'Tang';
  names_data.r_country_names('DK').female_middle_names(35) := 'Steen';
  names_data.r_country_names('DK').female_middle_names(36) := 'Kvist';
  names_data.r_country_names('DK').female_middle_names(37) := 'Olsen';
  names_data.r_country_names('DK').female_middle_names(38) := 'Nørregaard';
  names_data.r_country_names('DK').female_middle_names(39) := 'Fuglsang';
  names_data.r_country_names('DK').female_middle_names(40) := 'Wulff';
  names_data.r_country_names('DK').female_middle_names(41) := 'Damsgaard';
  names_data.r_country_names('DK').female_middle_names(42) := 'Hauge';
  names_data.r_country_names('DK').female_middle_names(43) := 'Sonne';
  names_data.r_country_names('DK').female_middle_names(44) := 'Skytte';
  names_data.r_country_names('DK').female_middle_names(45) := 'Brun';
  names_data.r_country_names('DK').female_middle_names(46) := 'Kronborg';
  names_data.r_country_names('DK').female_middle_names(47) := 'Abildgaard';
  names_data.r_country_names('DK').female_middle_names(48) := 'Fabricius';
  names_data.r_country_names('DK').female_middle_names(49) := 'Bille';
  names_data.r_country_names('DK').female_middle_names(50) := 'Skaarup';

  -- Efternavne
  names_data.r_country_names('DK').last_names(1) := 'Andersen';
  names_data.r_country_names('DK').last_names(2) := 'Andersson';
  names_data.r_country_names('DK').last_names(3) := 'Andreasen';
  names_data.r_country_names('DK').last_names(4) := 'Andreassen';
  names_data.r_country_names('DK').last_names(5) := 'Andresen';
  names_data.r_country_names('DK').last_names(6) := 'Asmussen';
  names_data.r_country_names('DK').last_names(7) := 'Bach';
  names_data.r_country_names('DK').last_names(8) := 'Bak';
  names_data.r_country_names('DK').last_names(9) := 'Bang';
  names_data.r_country_names('DK').last_names(10) := 'Bech';
  names_data.r_country_names('DK').last_names(11) := 'Beck';
  names_data.r_country_names('DK').last_names(12) := 'Bendtsen';
  names_data.r_country_names('DK').last_names(13) := 'Berg';
  names_data.r_country_names('DK').last_names(14) := 'Bertelsen';
  names_data.r_country_names('DK').last_names(15) := 'Berthelsen';
  names_data.r_country_names('DK').last_names(16) := 'Bisgård';
  names_data.r_country_names('DK').last_names(17) := 'Bisgaard';
  names_data.r_country_names('DK').last_names(18) := 'Bjerre';
  names_data.r_country_names('DK').last_names(19) := 'Bjerregård';
  names_data.r_country_names('DK').last_names(20) := 'Bjerregaard';
  names_data.r_country_names('DK').last_names(21) := 'Bonde';
  names_data.r_country_names('DK').last_names(22) := 'Brandt';
  names_data.r_country_names('DK').last_names(23) := 'Brodersen';
  names_data.r_country_names('DK').last_names(24) := 'Bruun';
  names_data.r_country_names('DK').last_names(25) := 'Buch';
  names_data.r_country_names('DK').last_names(26) := 'Bundgård';
  names_data.r_country_names('DK').last_names(27) := 'Bundgaard';
  names_data.r_country_names('DK').last_names(28) := 'Carlsen';
  names_data.r_country_names('DK').last_names(29) := 'Carstensen';
  names_data.r_country_names('DK').last_names(30) := 'Christensen';
  names_data.r_country_names('DK').last_names(31) := 'Christiansen';
  names_data.r_country_names('DK').last_names(32) := 'Christoffersen';
  names_data.r_country_names('DK').last_names(33) := 'Clausen';
  names_data.r_country_names('DK').last_names(34) := 'Dahl';
  names_data.r_country_names('DK').last_names(35) := 'Dalgård';
  names_data.r_country_names('DK').last_names(36) := 'Dalgaard';
  names_data.r_country_names('DK').last_names(37) := 'Dalsgård';
  names_data.r_country_names('DK').last_names(38) := 'Dalsgaard';
  names_data.r_country_names('DK').last_names(39) := 'Dam';
  names_data.r_country_names('DK').last_names(40) := 'Damgård';
  names_data.r_country_names('DK').last_names(41) := 'Damgaard';
  names_data.r_country_names('DK').last_names(42) := 'Danielsen';
  names_data.r_country_names('DK').last_names(43) := 'Davidsen';
  names_data.r_country_names('DK').last_names(44) := 'Enevoldsen';
  names_data.r_country_names('DK').last_names(45) := 'Eriksen';
  names_data.r_country_names('DK').last_names(46) := 'Eskildsen';
  names_data.r_country_names('DK').last_names(47) := 'Fischer';
  names_data.r_country_names('DK').last_names(48) := 'Frandsen';
  names_data.r_country_names('DK').last_names(49) := 'Frederiksen';
  names_data.r_country_names('DK').last_names(50) := 'Friis';
  names_data.r_country_names('DK').last_names(51) := 'Frost';
  names_data.r_country_names('DK').last_names(52) := 'Gade';
  names_data.r_country_names('DK').last_names(53) := 'Gregersen';
  names_data.r_country_names('DK').last_names(54) := 'Hald';
  names_data.r_country_names('DK').last_names(55) := 'Hansen';
  names_data.r_country_names('DK').last_names(56) := 'Hassan';
  names_data.r_country_names('DK').last_names(57) := 'Hedegård';
  names_data.r_country_names('DK').last_names(58) := 'Hedegaard';
  names_data.r_country_names('DK').last_names(59) := 'Hemmingsen';
  names_data.r_country_names('DK').last_names(60) := 'Henningsen';
  names_data.r_country_names('DK').last_names(61) := 'Henriksen';
  names_data.r_country_names('DK').last_names(62) := 'Hermansen';
  names_data.r_country_names('DK').last_names(63) := 'Hjorth';
  names_data.r_country_names('DK').last_names(64) := 'Hoffmann';
  names_data.r_country_names('DK').last_names(65) := 'Holm';
  names_data.r_country_names('DK').last_names(66) := 'Holst';
  names_data.r_country_names('DK').last_names(67) := 'Hougård';
  names_data.r_country_names('DK').last_names(68) := 'Hougaard';
  names_data.r_country_names('DK').last_names(69) := 'Ibsen';
  names_data.r_country_names('DK').last_names(70) := 'Iversen';
  names_data.r_country_names('DK').last_names(71) := 'Jacobsen';
  names_data.r_country_names('DK').last_names(72) := 'Jakobsen';
  names_data.r_country_names('DK').last_names(73) := 'Jensen';
  names_data.r_country_names('DK').last_names(74) := 'Jeppesen';
  names_data.r_country_names('DK').last_names(75) := 'Jepsen';
  names_data.r_country_names('DK').last_names(76) := 'Jespersen';
  names_data.r_country_names('DK').last_names(77) := 'Jessen';
  names_data.r_country_names('DK').last_names(78) := 'Johannesen';
  names_data.r_country_names('DK').last_names(79) := 'Johannsen';
  names_data.r_country_names('DK').last_names(80) := 'Johansen';
  names_data.r_country_names('DK').last_names(81) := 'Johansson';
  names_data.r_country_names('DK').last_names(82) := 'Johnsen';
  names_data.r_country_names('DK').last_names(83) := 'Juhl';
  names_data.r_country_names('DK').last_names(84) := 'Justesen';
  names_data.r_country_names('DK').last_names(85) := 'Juul';
  names_data.r_country_names('DK').last_names(86) := 'Jønsson';
  names_data.r_country_names('DK').last_names(87) := 'Jørgensen';
  names_data.r_country_names('DK').last_names(88) := 'Nielsen';
  names_data.r_country_names('DK').last_names(89) := 'Pedersen';
  names_data.r_country_names('DK').last_names(90) := 'Sørensen';
  names_data.r_country_names('DK').last_names(91) := 'Rasmussen';
  names_data.r_country_names('DK').last_names(92) := 'Petersen';
  names_data.r_country_names('DK').last_names(93) := 'Madsen';
  names_data.r_country_names('DK').last_names(94) := 'Kristensen';
  names_data.r_country_names('DK').last_names(95) := 'Olsen';
  names_data.r_country_names('DK').last_names(96) := 'Thomsen';
  names_data.r_country_names('DK').last_names(97) := 'Poulsen';
  names_data.r_country_names('DK').last_names(98) := 'Mortensen';
  names_data.r_country_names('DK').last_names(99) := 'Møller';
  names_data.r_country_names('DK').last_names(100) := 'Søndergaard';


end names_data_dk;
/
