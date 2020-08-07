trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    
    list<task> tlist = new list<task>();
    for (opportunity o: trigger.new)
    {
        if(o.stageName == 'Closed Won')
        {
            task t = new task();
            t.whatid = o.id;
            t.Subject = 'Follow Up Test Task';
            tlist.add(t);
        }        
    }
    insert tlist;
    
    
    

}