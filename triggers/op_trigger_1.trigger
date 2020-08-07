trigger op_trigger_1 on Opportunity (Before Insert,Before Update) {
 for(Opportunity a: Trigger.New){
 if(Trigger.isInsert && a.Amount < 5000 )
 a.addError('Ammount cannot be less than 5k');
 
 else if (Trigger.isUpdate && a.Amount <3000)
 a.addError('Amount cannot be less than 3k');
 }
 

}