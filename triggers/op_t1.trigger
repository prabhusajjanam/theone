trigger op_t1 on Opportunity (before insert,before update) {
   for(opportunity o:trigger.new)
   {
    //if(o.amount < 50000)
    //o.addError(' value cannot be less than 50000');
     if(Trigger.isinsert && o.amount <50000)
        {
        o.addError(' value cannot be less than 50000');
        }
    if(Trigger.isupdate && o.amount < 30000)
    {
    
    o.addError('enter a value greater than 30000');
    }
   }
}