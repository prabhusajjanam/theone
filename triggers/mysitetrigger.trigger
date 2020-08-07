trigger mysitetrigger on Account (before insert) {

    for (account a: trigger.new )
    {
        if (a.site != null)
        {
             a.My_site__c = 'TriggerValue';        
        }
        else
        {
            a.adderror('Please provide Site value before saving');
        }
    }
}