create or replace package investment_data

as

  /** Metadata information for investment functions.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version         varchar2(250) := '1.3.0';

  type swift_rec is record (
    swift_id            varchar2(50)
    , swift_name        varchar2(4000)
  );

  type swift_tab is table of swift_rec;

  type swift_category_rec is record (
    category_name       varchar2(200)
    , swift_messages    swift_tab
  );

  type swift_category_tab is table of swift_category_rec;

  g_swift_messages          swift_category_tab;

  -- Fund adjectives
  g_fund_adjectives         varchar2(32000) := 'Growth,Mid-Cap Opportunities,Global,Smaller Companies,Top 100,Top 200,International Small Cap,Value,High Income,Floating Rate,Income Allocation,Tax-Free Income,Equity Long-Short,Large Cap Growth,Small Cap Growth,Emerging Markets,High Yield,Vision,Charter,Balanced-Risk,Diversified Dividend,Banking,Premium Money Market,Global Balanced';

  -- Wealth products
  g_wealth_products         varchar2(32000) := 'Structured Note,Mutual Fund,Time Deposit,FX Option,Equity,Bond,Insurance,Accumulator,Decumulator';

  -- Bond ratings
  g_bond_ratings            varchar2(4000) := 'AAA,AA+,AA,AA-,A+,A,A-,BBB+,BBB,BBB-,BB+,BB,BB-,B+,B,B-,CCC+,CCC,CCC-,CC,C,D';

end investment_data;
/
