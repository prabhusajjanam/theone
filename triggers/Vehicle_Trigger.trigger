trigger Vehicle_Trigger on Vehicle__c (after insert,after update) {
    
    for(vehicle__c v : trigger.new)
    {
        system.debug('vehicles contacts accountid is '+ v.contact__r.accountid);
        
    }

}