trigger Op_trigger_2 on Opportunity (After Insert) {
 Contact c = new Contact();
 for(Opportunity o : Trigger.new){
 c.AccountID = o.AccountID;
 c.FirstName = 'Opportunity';
 c.LastName = 'Owner';
 insert c;
 }
 

}