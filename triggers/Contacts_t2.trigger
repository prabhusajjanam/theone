trigger Contacts_t2 on Opportunity (Before Insert) {
  trigger_class.check_opp(Trigger.New);
  

}