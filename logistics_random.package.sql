create or replace package logistics_random

as

    npg_version         varchar2(250) := '1.3.0';

    function r_container_bic (
        r_country                   varchar2        default null
    )
    return varchar2;

    function r_container_bic_company (
        r_country                   varchar2        default null
    )
    return varchar2;

    function r_container_serial_number
    return number;

    function r_container_number (
        r_container_bic             varchar2        default null
        , r_container_serial_number number          default null
    )
    return varchar2;

    function r_container_size_iso
    return varchar2;

end logistics_random;
/