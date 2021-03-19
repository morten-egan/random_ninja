alter table sg_football_bet add (
    bet_date                    date
    , bet_odds_risk_value       number
);

alter table sg_football_bet add constraint football_bet_date_nn check (bet_date is not null);

alter table strategy_positional_attributes add (
    risk_acceptance_level       number
);