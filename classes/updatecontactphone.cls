//Execute this job in anonymous window using : Id batchJobId = Database.executeBatch(new updatecontactphone(), 200);
global class updatecontactphone implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'select id,accountid,phone from contact';
        return Database.getQueryLocator(query);
    }
   
    global void execute(Database.BatchableContext BC, List<contact> scope)
    {
         set <ID> mycontactaccountids = new set <ID>();
         for(contact c : scope)
         {   
             mycontactaccountids.add(c.accountid);           
         }
         
         map<id,account>  myaccountmap = new map<id,account>([select id,phone from account where id in :mycontactaccountids]);
         list<contact>  contactlisttoupdate = new list<contact>();
         
         for (contact c: scope)
         {
          If (myaccountmap.containskey(c.accountid))
          {
             account acc = myaccountmap.get(c.accountid);
             c.phone = acc.phone;
             contactlisttoupdate.add(c);
          }
        
         }
         
         update contactlisttoupdate;
    }   
    global void finish(Database.BatchableContext BC)
    {
    }
}