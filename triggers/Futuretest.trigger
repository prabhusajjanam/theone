trigger Futuretest on Contact (before insert) {
    
    SET<string> accIds = new SET<string>();
    for(contact c : trigger.new)
    {
        accIds.add(c.accountId);
    }
    
    
    futuretestclass updateJob = new futuretestclass(accIds);
    // enqueue the job for processing
    ID jobID = System.enqueueJob(updateJob);
    
    for(contact c : trigger.new)
    {
       // c.addError('ha ha ');
    }
}