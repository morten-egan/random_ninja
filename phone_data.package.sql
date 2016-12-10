create or replace package phone_data

as

  /** Helper data for generation of phone random data.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '0.0.1';

  type phone_country_rec is record (
    mcc_number                      number
    , intl_num_code                 number
    , mnc                           varchar2(4000)
    , phone_num_format_landline     varchar2(50)
    , phone_num_format_mobile       varchar2(50)
  );
  type phone_country_tab is table of phone_country_rec index by varchar2(10);

  country_phone_data    phone_country_tab;

  g_cdr_call_types              varchar2(4000) := 'MOC,MTC,SMS-MO,SMS-MT,MMS-MO,MMS-MT,GPRS';
  g_cdr_call_service_types      varchar2(4000) := 'Voice,Fax,Text,Video,Image,3G,LTE,4G';

  g_phone_brands                varchar2(4000) := 'Nokia,Samsung,OPPO,Xiaomi,Apple,LG,Huawei,Microsoft,Sony,HTC,Motorola,Alcatel,Lenovo';

end phone_data;
/
