trigger contact_creation_trigger on Account (After Insert) {
list<contact> contactlist = new list<contact>();     // list of contacts
        for (account acc: trigger.new)
        {
            
            for ( integer i = 0; i < acc.account_contacts_number__c ; i++)
            {
                contact con = new contact();// for each loop through this sobject creating a record and adding to the contactlist<LIST> but how ccount for account_contacts_number__c hardcoded _number
                con.accountid = acc.id;
                con.lastname = acc.name+'-'+'contact'+i;
                contactlist.add(con);     
            }        
        }
        
        insert contactlist;

}