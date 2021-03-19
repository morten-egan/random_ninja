-- Headers
start pools.package.sql
start new_strategy.package.sql
start football_data_analysis.package.sql
start football_api_data.package.sql
start core.package.sql
start finance.package.sql
start football_bet.package.sql

-- Bodies
start "pools.package body.sql"
start "new_strategy.package body.sql"
start "football_data_analysis.package body.sql"
start "football_api_data.package body.sql"
start "core.package body.sql"
start "finance.package body.sql"
start "football_bet.package body.sql"

select * from dual;

exit;