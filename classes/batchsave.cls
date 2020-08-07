public with sharing class batchsave {
    public batch__C mybatch {get;set;}
    public string cityname {get;set;}
    
    public batchsave(ApexPages.StandardController controller) {
    	string bId = (string)controller.getId();
        mybatch = [select id,name,Faculty_Name__c,Date_of_Starting__c,programs__c from batch__c where id = :bId];
        mybatch.name = 'NewName';
        mybatch.Batch_Phone__c = '1231231231';
    }
    
    public void save(){
    	update mybatch;    
    }  
}