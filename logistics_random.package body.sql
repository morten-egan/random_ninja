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

end logistics_random;
/