public with sharing class passengerlogicclass {
    public passenger__c myp{get;set;}
    public passengerlogicclass(ApexPages.StandardController controller) {
     myp = (passenger__C) controller.getrecord();
    }
    
    public void save()
    {
    insert myp;
    }

}