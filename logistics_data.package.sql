create or replace package logistics_data

as

    npg_version         varchar2(250) := '1.3.0';

    type bic_data is record (
        bic_code            varchar2(50)
        , bic_company       varchar2(500)
        , bic_city          varchar2(500)
    );
    type bic_data_tab is table of bic_data;
    type country_bics is table of bic_data_tab index by varchar2(200);
    bics            country_bics;

    init_data   varchar2(250);

end logistics_data;
/