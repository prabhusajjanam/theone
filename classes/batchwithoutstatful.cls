global class batchwithoutstatful implements database.batchable<Account>
{
	public list<string> recordTypeIds;
	//constructor (without any parameters)
    public static void batchwithoutstateful()
    {
        //logic to populate recordTypesIds
        
    }
    
    //constructor (with parameters)
    public static void batchwithoutstateful(string sobjectType)
    {
        if(sobjectType == 'Opportunity')
        {
            //get opportunity recordtypes and populate it.
            
        }
        
    }
    
    
    
    
global iterable<Account> start(database.batchablecontext bc)
{

return new iterableclass();

}

global void execute(database.batchablecontext bc, list<Account> scope)
{
list<contact> conlist = new list<contact>();
    for (Account s:scope)
    {
        for(contact c: s.contacts)
        {        
        conlist.add(c);        
        }
        s.number_of_contacts__c = conlist.size();
    }
    update scope;
}

global void finish(database.batchablecontext bc)
{
    asyncapexjob a = [select id,status,numberoferrors,jobitemsprocessed,totaljobitems,createdby.email from AsyncApexJob where id = :bc.getjobid()];
    messaging.singleemailmessage mail = new messaging.singleemailmessage();
    String[] toaddresses = new string[] {'prabhusajjanam@gmail.com','shivakanth413@gmail.com'};
    mail.setToAddresses(toAddresses);
    mail.setSubject('Batch Processing');
    mail.setPlainTextBody('The Batch apex job processed ' +a.totalJobItems+ 'batches with' +a.numberOferrors+ 'failures');
    messaging.sendEmail(new messaging.singleEmailMessage[] {mail});
}




}