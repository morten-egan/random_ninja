create or replace package company_data

as

  /** Data to help generate random company data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version                 varchar2(250) := '1.1.0';

  g_company_endings           varchar2(32000) := 'Inc.,Corp.,Corperation,Company,Warehousing,and Co.,Logistics,Telecom,Associates,Enterprise,Chemicals,Industries,Holdings,Bank,Motors,Goods,Agency';

  type tax_id_rec is record (
    tax_id_format             varchar2(4000)
    , tax_id_display_format   varchar2(4000)
  );
  type tax_id_tab is table of tax_id_rec index by varchar2(10);
  tax_id      tax_id_tab;

end company_data;
/
