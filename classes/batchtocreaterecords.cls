global class batchtocreaterecords implements database.batchable<Account>,Database.stateful
{
list <contact> conlist = new list<contact>();
integer i;

global iterable<Account> start(database.batchablecontext bc)
{

return new iterableAccGenclass();

}

global void execute(database.batchablecontext bc, list<Account> scope)
{
system.debug('account list is' +scope);

    for (Account a:scope)
    {   
        system.debug('came inside account for loop');
        for ( i=0; i >= 3 ; i++)
        {
          system.debug('coming inside contact for loop');
          contact c = new contact();
          c.accountid = a.id;
          c.lastname = 'bybatch'+i;
          conlist.add(c);
          system.debug('conlist' +conlist);
        }
    }


}

global void finish(database.batchablecontext bc)
{
    update conlist;
    asyncapexjob a = [select id,status,numberoferrors,jobitemsprocessed,totaljobitems,createdby.email from AsyncApexJob where id = :bc.getjobid()];
    messaging.singleemailmessage mail = new messaging.singleemailmessage();
    String[] toaddresses = new string[] {'prabhusajjanam@gmail.com','shivakanth413@gmail.com'};
    mail.setToAddresses(toAddresses);
    mail.setSubject('Batch Processing');
    mail.setPlainTextBody('The Batch apex job to create records processed ' +a.totalJobItems+ 'batches with' +a.numberOferrors+ 'failures');
    messaging.sendEmail(new messaging.singleEmailMessage[] {mail});
}




}