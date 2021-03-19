create or replace package body company_data

as

begin
  -- Test comment
  dbms_application_info.set_client_info('company_data');
  dbms_session.set_identifier('company_data');

  -- US Tax id format.
  tax_id('US').tax_id_format := '[10,12,60,67,50,53,01,02,03,04,05,06,11,13,14,16,21,22,23,25,34,51,52,54,55,56,57,58,59,65,30,32,35,36,37,38,61,15,24,40,44,94,95,80,90,33,39,41,42,43,48,62,63,64,66,68,71,72,73,74,75,76,77,82,83,84,85,86,87,88,91,92,93,98,99,20,26,27,45,46,47,81,31]########';
  tax_id('US').tax_id_display_format := '##-#######';
  -- China tax id format.
  tax_id('CN').tax_id_format := '9[1-6][110000-830000]##########';
  tax_id('CN').tax_id_display_format := '##################';

end company_data;
/
