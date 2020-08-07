trigger recursion2 on Account (after update) {
list<account> accountlist = new list<account>();
     set<id> accids = new set<id>();
     system.debug('trigger.new in recursion2 is ' +trigger.new);
     for (account a: trigger.new)
     {
             accids.add(a.id);
     }
     
     list<account> acclist = [select id,phone,fax from account where id in :accids];
     for (account a: acclist)
     {
         if (a.phone == '1234567890')
         {
         a.fax = '1234567890';         
         }
         accountlist.add(a);   
     }
     system.debug('theRecurionHandling.allow value in recursion2 is ' + theRecursionHandling.allow);
    if(theRecursionHandling.allow == true)
     {
         theRecursionHandling.allow = false;
         update acclist;
     }
       
}