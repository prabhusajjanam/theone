trigger testopptrigger on opportunity (before update,before insert,after update,after insert) {
for (opportunity o : trigger.new)
{ 
    if(trigger.isupdate)
    {
     if(trigger.isbefore)
     {
        system.debug('trigger.isbeforeupdate');
     }
     if(trigger.isafter)
     {
        system.debug('trigger.isafterupdate');
     }
    }
    if(trigger.isinsert)
    {
         if(trigger.isbefore)
     {
        system.debug('trigger.isbeforeinsert');
     }
     if(trigger.isafter)
     {
        system.debug('trigger.isafterinsert');
     }
    }

}
}