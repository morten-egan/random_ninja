create or replace package logistics_random

as

    npg_version         varchar2(250) := '1.3.0';

    function r_container_bic (
        r_country           varchar2        default null
    )
    return varchar2;

end logistics_random;
/