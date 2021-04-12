create or replace package body logistics_data

as

begin

    -- Init specific logistics data.
  init_data := logistics_data_bic.npg_version;

  -- ISO Container sizes
  iso_container_sizes := iso_container_size_tab(null);
  iso_container_sizes.extend(82);


  iso_container_sizes(1).iso_code := '20G0';
  iso_container_sizes(1).iso_description := 'GENERAL PURPOSE CONT.';
  iso_container_sizes(2).iso_code := '20G1';
  iso_container_sizes(2).iso_description := 'GENERAL PURPOSE CONT.';
  iso_container_sizes(3).iso_code := '20H0';
  iso_container_sizes(3).iso_description := 'INSULATED CONTAINER';
  iso_container_sizes(4).iso_code := '20P1';
  iso_container_sizes(4).iso_description := 'FLAT (FIXED ENDS)';
  iso_container_sizes(5).iso_code := '20T3';
  iso_container_sizes(5).iso_description := 'TANK CONTAINER';
  iso_container_sizes(6).iso_code := '20T4';
  iso_container_sizes(6).iso_description := 'TANK CONTAINER';
  iso_container_sizes(7).iso_code := '20T5';
  iso_container_sizes(7).iso_description := 'TANK CONTAINER';
  iso_container_sizes(8).iso_code := '20T6';
  iso_container_sizes(8).iso_description := 'TANK CONTAINER';
  iso_container_sizes(9).iso_code := '20T7';
  iso_container_sizes(9).iso_description := 'TANK CONTAINER';
  iso_container_sizes(10).iso_code := '20T8';
  iso_container_sizes(10).iso_description := 'TANK CONTAINER';
  iso_container_sizes(11).iso_code := '20T0';
  iso_container_sizes(11).iso_description := 'TANK CONTAINER';
  iso_container_sizes(12).iso_code := '20T1';
  iso_container_sizes(12).iso_description := 'TANK CONTAINER';
  iso_container_sizes(13).iso_code := '20T2';
  iso_container_sizes(13).iso_description := 'TANK CONTAINER';
  iso_container_sizes(14).iso_code := '22B0';
  iso_container_sizes(14).iso_description := 'BULK CONTAINER';
  iso_container_sizes(15).iso_code := '22G0';
  iso_container_sizes(15).iso_description := 'GENERAL PURPOSE CONT.';
  iso_container_sizes(16).iso_code := '22G1';
  iso_container_sizes(16).iso_description := 'GENERAL PURPOSE CONT.';
  iso_container_sizes(17).iso_code := '22H0';
  iso_container_sizes(17).iso_description := 'INSULATED CONTAINER';
  iso_container_sizes(18).iso_code := '22P3';
  iso_container_sizes(18).iso_description := 'FLAT (COLLAPSIBLE)';
  iso_container_sizes(19).iso_code := '22P8';
  iso_container_sizes(19).iso_description := 'FLAT (COLL.FLUSH FOLDING)';
  iso_container_sizes(20).iso_code := '22P9';
  iso_container_sizes(20).iso_description := 'FLAT (COLLAPSIBLE)';
  iso_container_sizes(21).iso_code := '22P1';
  iso_container_sizes(21).iso_description := 'FLAT (FIXED ENDS)';
  iso_container_sizes(22).iso_code := '22P7';
  iso_container_sizes(22).iso_description := 'FLAT (GENSET CARRIER)';
  iso_container_sizes(23).iso_code := '22R9';
  iso_container_sizes(23).iso_description := 'REEFER CONT.(NO FOOD)';
  iso_container_sizes(24).iso_code := '22R7';
  iso_container_sizes(24).iso_description := 'BUILT-IN GEN. F. POWER SPLY OF REEF';
  iso_container_sizes(25).iso_code := '22R1';
  iso_container_sizes(25).iso_description := 'REEFER CONTAINER';
  iso_container_sizes(26).iso_code := '22S1';
  iso_container_sizes(26).iso_description := 'NAMED CARGO CONTAINER';
  iso_container_sizes(27).iso_code := '22T3';
  iso_container_sizes(27).iso_description := 'TANK CONTAINER';
  iso_container_sizes(28).iso_code := '22T4';
  iso_container_sizes(28).iso_description := 'TANK CONTAINER';
  iso_container_sizes(29).iso_code := '22T5';
  iso_container_sizes(29).iso_description := 'TANK CONTAINER';
  iso_container_sizes(30).iso_code := '22T6';
  iso_container_sizes(30).iso_description := 'TANK CONTAINER';
  iso_container_sizes(31).iso_code := '22T7';
  iso_container_sizes(31).iso_description := 'TANK CONTAINER';
  iso_container_sizes(32).iso_code := '22T8';
  iso_container_sizes(32).iso_description := 'TANK CONTAINER';
  iso_container_sizes(33).iso_code := '22T0';
  iso_container_sizes(33).iso_description := 'TANK CONTAINER';
  iso_container_sizes(34).iso_code := '22T1';
  iso_container_sizes(34).iso_description := 'TANK CONTAINER';
  iso_container_sizes(35).iso_code := '22T2';
  iso_container_sizes(35).iso_description := 'TANK CONTAINER';
  iso_container_sizes(36).iso_code := '22U6';
  iso_container_sizes(36).iso_description := 'HARDTOP CONTAINER';
  iso_container_sizes(37).iso_code := '22U1';
  iso_container_sizes(37).iso_description := 'OPEN TOP CONTAINER';
  iso_container_sizes(38).iso_code := '22V0';
  iso_container_sizes(38).iso_description := 'VENTILATED CONTAINER';
  iso_container_sizes(39).iso_code := '22V2';
  iso_container_sizes(39).iso_description := 'VENTILATED CONTAINER';
  iso_container_sizes(40).iso_code := '22V3';
  iso_container_sizes(40).iso_description := 'VENTILATED CONTAINER';
  iso_container_sizes(41).iso_code := '25G0';
  iso_container_sizes(41).iso_description := 'GP-CONTAINER OVER-HEIGHT';
  iso_container_sizes(42).iso_code := '26G0';
  iso_container_sizes(42).iso_description := 'GP-CONTAINER OVER-HEIGHT';
  iso_container_sizes(43).iso_code := '26H0';
  iso_container_sizes(43).iso_description := 'INSULATED CONTAINER';
  iso_container_sizes(44).iso_code := '28T8';
  iso_container_sizes(44).iso_description := 'TANK FOR GAS';
  iso_container_sizes(45).iso_code := '28U1';
  iso_container_sizes(45).iso_description := 'OPEN TOP (HALF HEIGHT)';
  iso_container_sizes(46).iso_code := '28V0';
  iso_container_sizes(46).iso_description := 'VE-HALF-HEIGHT =1448 MM HEIGHT';
  iso_container_sizes(47).iso_code := '29P0';
  iso_container_sizes(47).iso_description := 'PLATFORM';
  iso_container_sizes(48).iso_code := '2EG0';
  iso_container_sizes(48).iso_description := 'HIGH CUBE CONT. (WIDTH 2.5M)';
  iso_container_sizes(49).iso_code := '42G0';
  iso_container_sizes(49).iso_description := 'GENERAL PURPOSE CONT.';
  iso_container_sizes(50).iso_code := '42G1';
  iso_container_sizes(50).iso_description := 'GENERAL PURPOSE CONT.';
  iso_container_sizes(51).iso_code := '42H0';
  iso_container_sizes(51).iso_description := 'INSULATED CONTAINER';
  iso_container_sizes(52).iso_code := '42P3';
  iso_container_sizes(52).iso_description := 'FLAT (COLLAPSIBLE)';
  iso_container_sizes(53).iso_code := '42P8';
  iso_container_sizes(53).iso_description := 'FLAT (COLL.FLUSH FOLDING)';
  iso_container_sizes(54).iso_code := '42P9';
  iso_container_sizes(54).iso_description := 'FLAT (COLLAPSIBLE)';
  iso_container_sizes(55).iso_code := '42P1';
  iso_container_sizes(55).iso_description := 'FLAT (FIXED ENDS)';
  iso_container_sizes(56).iso_code := '42P6';
  iso_container_sizes(56).iso_description := 'FLAT SPACE SAVER';
  iso_container_sizes(57).iso_code := '42R9';
  iso_container_sizes(57).iso_description := 'REEFER CONT.(NO FOOD)';
  iso_container_sizes(58).iso_code := '42R3';
  iso_container_sizes(58).iso_description := 'REEFER CONT.(DIESEL GEN.)';
  iso_container_sizes(59).iso_code := '42R1';
  iso_container_sizes(59).iso_description := 'REEFER CONTAINER';
  iso_container_sizes(60).iso_code := '42S1';
  iso_container_sizes(60).iso_description := 'NAMED CARGO CONTAINER';
  iso_container_sizes(61).iso_code := '42T5';
  iso_container_sizes(61).iso_description := 'TANK CONTAINER';
  iso_container_sizes(62).iso_code := '42T6';
  iso_container_sizes(62).iso_description := 'TANK CONTAINER';
  iso_container_sizes(63).iso_code := '42T8';
  iso_container_sizes(63).iso_description := 'TANK CONTAINER';
  iso_container_sizes(64).iso_code := '42T2';
  iso_container_sizes(64).iso_description := 'TANK CONTAINER';
  iso_container_sizes(65).iso_code := '42U6';
  iso_container_sizes(65).iso_description := 'HARDTOP CONTAINER';
  iso_container_sizes(66).iso_code := '42U1';
  iso_container_sizes(66).iso_description := 'OPEN TOP CONTAINER';
  iso_container_sizes(67).iso_code := '45B3';
  iso_container_sizes(67).iso_description := 'BULK CONTAINER';
  iso_container_sizes(68).iso_code := '45G0';
  iso_container_sizes(68).iso_description := 'HIGH CUBE CONTAINER';
  iso_container_sizes(69).iso_code := '45G1';
  iso_container_sizes(69).iso_description := 'HIGH CUBE CONT.';
  iso_container_sizes(70).iso_code := '45P3';
  iso_container_sizes(70).iso_description := 'FLAT (COLLAPSIBLE)';
  iso_container_sizes(71).iso_code := '45P8';
  iso_container_sizes(71).iso_description := 'FLAT (COLL.FLUSH FOLDING)';
  iso_container_sizes(72).iso_code := '45R9';
  iso_container_sizes(72).iso_description := 'REEFER CONT.(NO FOOD)';
  iso_container_sizes(73).iso_code := '45R1';
  iso_container_sizes(73).iso_description := 'REEFER HIGHCUBE CONTAINER';
  iso_container_sizes(74).iso_code := '45U1';
  iso_container_sizes(74).iso_description := 'OPEN TOP CONTAINER';
  iso_container_sizes(75).iso_code := '45U6';
  iso_container_sizes(75).iso_description := 'HIGH CUBE HARDTOP CONT.';
  iso_container_sizes(76).iso_code := '46H0';
  iso_container_sizes(76).iso_description := 'INSULATED CONTAINER';
  iso_container_sizes(77).iso_code := '48T8';
  iso_container_sizes(77).iso_description := 'TANK FOR GAS';
  iso_container_sizes(78).iso_code := '49P0';
  iso_container_sizes(78).iso_description := 'PLATFORM';
  iso_container_sizes(79).iso_code := '4CG0';
  iso_container_sizes(79).iso_description := 'GP CONTAINER (WIDTH 2.5 M)';
  iso_container_sizes(80).iso_code := 'L0G1';
  iso_container_sizes(80).iso_description := 'HIGH CUBE CONT.';
  iso_container_sizes(81).iso_code := 'L2G1';
  iso_container_sizes(81).iso_description := 'HIGH CUBE CONT.';
  iso_container_sizes(82).iso_code := 'L5G1';
  iso_container_sizes(82).iso_description := 'HIGH CUBE CONT.';

end logistics_data;
/