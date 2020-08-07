trigger oppDuplicateCheck on Case_Opportunity__c (before insert) {

    list<opportunity> opplist = [select id,name from opportunity ];
    set<string> existingnames = new set<string>();
    for(opportunity o : opplist)
    {
       existingnames.add(o.name);
    }
    
    for(case_opportunity__c co : trigger.new)
    {
       if(existingnames.contains(co.name))
       {
           co.adderror('Use Different Name because there is an opportunity with same name');
       }
    }
    
}