create or replace package body logistics_random

as

    npg_version         varchar2(250) := '1.3.0';

    function r_container_bic (
        r_country           varchar2        default null
    )
    return varchar2
    
    as
    
        l_ret_var           varchar2(4000);
        l_bic_reg_num       number;
        l_country_idx       varchar2(250) := r_country;

    begin

        if l_country_idx is null then
            l_country_idx := util_random.ru_pickone(core_random_v.g_shipping_bic_countries_implemented);
        end if;

        l_bic_reg_num := core_random.r_natural(1, logistics_data.bics(l_country_idx).count);

        l_ret_var := logistics_data.bics(l_country_idx)(l_bic_reg_num).bic_code;

        return l_ret_var;

    end r_container_bic;

    function r_container_bic_company (
        r_country           varchar2        default null
    )
    return varchar2
    
    as
    
        l_ret_var           varchar2(4000);
        l_bic_reg_num       number;
        l_country_idx       varchar2(250) := r_country;

    begin

        if l_country_idx is null then
            l_country_idx := util_random.ru_pickone(core_random_v.g_shipping_bic_countries_implemented);
        end if;

        l_bic_reg_num := core_random.r_natural(1, logistics_data.bics(l_country_idx).count);

        l_ret_var := logistics_data.bics(l_country_idx)(l_bic_reg_num).bic_company;

        return l_ret_var;

    end r_container_bic_company;

    function r_container_serial_number
    return number

    as

        l_ret_var           number;

    begin

        l_ret_var := util_random.ru_replace('######');

        return l_ret_var;

    end r_container_serial_number;

    function r_container_number (
        r_container_bic             varchar2        default null
        , r_container_serial_number number          default null
    )
    return varchar2

    as

        l_ret_var                   varchar2(4000);
        l_container_bic             varchar2(4000) := r_container_bic;
        l_container_serial_number   number := r_container_serial_number;
        l_check_digit               number;

    begin

        if l_container_bic is null then
            l_container_bic := logistics_random.r_container_bic;
        end if;
 
        if l_container_serial_number is null then
            l_container_serial_number := logistics_random.r_container_serial_number;
        end if;

        l_check_digit := util_random.ru_bic_checkdigit(l_container_bic, l_container_serial_number);

        l_ret_var := l_container_bic || ' ' || to_char(l_container_serial_number) || '-' || to_char(l_check_digit);

        return l_ret_var;

    end r_container_number;

    function r_container_size_iso
    return varchar2

    as

        l_ret_var               varchar2(4000);
        l_idx_num               number;

    begin

        l_idx_num := core_random.r_natural(1, logistics_data.iso_container_sizes.count);

        l_ret_var := logistics_data.iso_container_sizes(l_idx_num).iso_code;

        return l_ret_var;

    end r_container_size_iso;

    function r_container_max_weight (
        r_container_size_iso        varchar2        default null
        , r_pounds                  boolean         default false
    )
    return number

    as

        l_ret_var               number;

    begin

        if r_pounds then
            l_ret_var := 30480 * 2;
        else
            l_ret_var := 30480;
        end if;

        return l_ret_var;

    end r_container_max_weight;

    function r_container_tare_weight (
        r_container_size_iso        varchar2        default null
        , r_pounds                  boolean         default false
    )
    return number

    as

        l_ret_var               number;

    begin

        if r_pounds then
            l_ret_var := 2180 * 2;
        else
            l_ret_var := 2180;
        end if;

        return l_ret_var;

    end r_container_tare_weight;

    function r_container_max_pack_weight (
        r_container_size_iso        varchar2        default null
        , r_container_max_weight    number          default null
        , r_container_tare_weight   number          default null
        , r_pounds                  boolean         default false
    )
    return number

    as

        l_ret_var               number;
        l_container_size_iso    varchar2(500) := r_container_size_iso;
        l_container_max_weight  number := r_container_max_weight;
        l_container_tare_weight number := r_container_tare_weight;
        l_pounds                boolean := r_pounds;

    begin

        -- Data value decision tree
        if l_container_size_iso is null then
            if l_container_max_weight is null then
                -- Get a max weight
                l_container_max_weight := logistics_random.r_container_max_weight(r_pounds => l_pounds);
            end if;
            if l_container_tare_weight is null then
                -- Get a tare weight
                l_container_tare_weight := logistics_random.r_container_tare_weight(r_pounds => l_pounds);
            end if;
        else
            -- Iso size set. Will override any values in max and tare parameters.
            l_container_max_weight := logistics_random.r_container_max_weight(l_container_size_iso, l_pounds);
            l_container_tare_weight := logistics_random.r_container_tare_weight(l_container_size_iso, l_pounds);
        end if;

        if l_pounds then
            l_ret_var := (l_container_max_weight - l_container_tare_weight) * 2;
        else
            l_ret_var := l_container_max_weight - l_container_tare_weight;
        end if;

        return l_ret_var;

    end r_container_max_pack_weight;

end logistics_random;
/