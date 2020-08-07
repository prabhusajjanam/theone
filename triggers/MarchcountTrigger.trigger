trigger MarchcountTrigger on Contact (after update,after insert,after delete,after undelete) 
{
map<id,list<date>> addeddates = new map<id,list<date>>();
map<id,list<date>> deleteddates = new map<id,list<date>>();
set<id> accountids = new set<id>();
list<account> acclist = new list<account>();

if(trigger.isinsert)
{
    for (contact con: trigger.new)
    {
        if(string.isnotblank(con.accountid))
        {
            if(!addeddates.containskey(con.accountid))
            {
                addeddates.put(con.accountid,new list<date>());
            }
            addeddates.get(con.accountid).add(con.date_of_contact__C);
            accountids.add(con.accountid);
            system.debug('accountid is' + con.accountid);
        }
    }
}

if(trigger.isupdate)
{
    for (contact con: trigger.new)
    {
    
    //changed
    if (string.isnotblank(con.accountid) && con.accountid != trigger.oldmap.get(con.id).accountid )
    {
        if(!addeddates.containskey(con.accountid))
        {
            addeddates.put(con.accountid,new list<date>());        
        }
        addeddates.get(con.accountid).add(con.date_of_contact__C);
        accountids.add(con.accountid);   
    }

    
    //removed
    if (string.isblank(con.accountid) && string.isnotblank(trigger.oldmap.get(con.id).accountid) )
    {
        if(!deleteddates.containskey(con.accountid))
        {
            deleteddates.put(con.accountid,new list<date>());        
        }
        deleteddates.get(con.accountid).add(con.date_of_contact__C);
        accountids.add(con.accountid);   
    }

    }
}
if (trigger.isdelete)
{
 for(contact con: trigger.old)
 {
    if(string.isnotblank(con.accountid))
    {
      if(!deleteddates.containskey(con.accountid))
      {
          deleteddates.put(con.accountid,new list<date>());      
      }  
         deleteddates.get(con.accountid).add(con.date_of_contact__c);
         accountids.add(con.accountid);  
    }

 }
}

if (trigger.isundelete)
{
 for(contact con: trigger.new)
 {
     if(string.isnotblank(con.accountid))
     {
     if(!addeddates.containskey(con.accountid))
     {
        addeddates.put(con.accountid,new list<date>());     
     }
       addeddates.get(con.accountid).add(con.date_of_contact__C);
       accountids.add(con.accountid);
     }
 
 }
 
}
system.debug('accountids are ' + accountids);
acclist = [select id , total_march_contacts__c, (select id,accountid,date_of_contact__c from contacts) from account where id in :accountids];
system.debug('acclist result is ' + acclist);
integer datecounter = 0;
for (account acc: acclist)
{
system.debug('addedates map' + addeddates.keyset());
if(addeddates.containskey(acc.id))
{
  for (date d: addeddates.get(acc.id))
  {
    system.debug('monthvalue' + d.month());
    if (d.month() == 3)
    {
     datecounter++;
    }
  }
}

if(deleteddates.containskey(acc.id))
{
    for (date d:deleteddates.get(acc.id))
    {
       system.debug('monthvalue' + d.month());
        if(d.month() == 3)
            {
            datecounter--;
            }
    }

}
acc.total_march_contacts__c = acc.total_march_contacts__c == null ? datecounter : (acc.total_march_contacts__c + datecounter);

}
update acclist;

}