trigger contactscount on Contact (after insert, after update, after undelete,after delete) {
map<id,list<contact>> addedcontacts = new map<id,list<contact>>();
map<id,list<contact>> deletedcontacts = new map<id,list<contact>>();
set<id> accountids = new set<id>();
list<account> accountlist = new list<account>();


if(trigger.isinsert)
{
    for (contact con: trigger.new)
    {
        if(string.isnotblank(con.accountid))
        {
            if(!addedcontacts.containskey(con.accountid))
            {
                addedcontacts.put(con.accountid,new list<contact>());
            }
            addedcontacts.get(con.accountid).add(con);
            accountids.add(con.accountid);
        }
    }
}
    
// in case of udpating a new contact

if(trigger.isupdate)
{
    for (contact con: trigger.new)
    {
        if(string.isnotblank(con.accountid)&& con.accountid != trigger.oldmap.get(con.id).accountid)
        {
            if(!addedcontacts.containskey(con.accountid))
            {
                addedcontacts.put(con.accountid,new list<contact>());
            }
            addedcontacts.get(con.accountid).add(con);
            accountids.add(con.accountid);
        }
        
        if(string.isblank(con.accountid)&&string.isnotblank(trigger.oldmap.get(con.id).accountid))
        {
            if(!deletedcontacts.containskey(con.accountid))
            {
                deletedcontacts.put(con.accountid,new list<contact>());            
            }
            deletedcontacts.get(con.accountid).add(con);
            accountids.add(con.accountid);
        }
        
    }
}

// in case of un-deleting a record

if (trigger.isundelete)
{
    for (contact con:trigger.new)
    {
        if(string.isnotblank(con.accountid))
        {
            if(!addedcontacts.containskey(con.accountid))
            {
                addedcontacts.put(con.accountid,new list<contact>());
            }
            addedcontacts.get(con.accountid).add(con);
            accountids.add(con.accountid);
        }
    }

}

// in case of deleting the record

if (trigger.isdelete)
{
    for (contact con:trigger.old)
    {
        if(string.isnotblank(con.accountid))
        {
            if(!deletedcontacts.containskey(con.accountid))
            {
                deletedcontacts.put(con.accountid,new list<contact>());
            }
            deletedcontacts.get(con.accountid).add(con);
            accountids.add(con.accountid);
        }
    }
}

// logic to handle the count of contacts

if(accountids.size() > 0)
{
    accountlist = [select id,number_of_contacts__c from account where id in :accountids];
    
    for (account acc: accountlist)
    {
        integer numofcontacts = 0;
        if(addedcontacts.containskey(acc.id))
        {
            numofcontacts += addedcontacts.get(acc.id).size();  
            system.debug('number of contacts' + numofcontacts);     
        }
        if(deletedcontacts.containskey(acc.id))
        {
            numofcontacts -= deletedcontacts.get(acc.id).size();
        }
          system.debug('number of contacts2' + numofcontacts);
          system.debug('field number of contacts'  + acc.Number_of_Contacts__c);
          
        acc.Number_of_Contacts__c = acc.Number_of_Contacts__c == null ? numofcontacts : (acc.Number_of_Contacts__c + numofcontacts); 
        //acc.Number_of_Contacts__c += numofcontacts; 
         
          system.debug('field number of contacts2'  + acc.Number_of_Contacts__c);
    }
    update accountlist;
    


}




}