create or replace package finance_data_account

as

  /** IBAN data for iban account number generation.
  * @author Morten Egan
  * @version 0.0.1
  * @project RANDOM_NINJA
  */
  npg_version                   varchar2(250) := '0.0.1';

  g_w_creditcard_tx_status      varchar2(4000) := 'Authorized/Pending Capture[6],Captured/Pending Settlement[2],Authorized/Held Pending Release[2],Could Not Void[1],Refund/Pending Settlement[1],Refund[1],Declined[2],Expired[2],Settled Successfully[82],Voided[1]';
  g_w_creditcard_tx_type        varchar2(4000) := 'Authorization Only[7],Authorization with Auto Capture[83],Capture Only[2],Credit[2],Offline Sale[2],Prior Authorization Capture[2],Void[2]';

end finance_data_account;
/
