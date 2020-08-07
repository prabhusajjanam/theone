trigger recursion1 on Account (after update) {
list<account> accountlist = new list<account>();

     system.debug('trigger.new in recursion1 is ' +trigger.new);
     set<id> accids = new set<id>();
     for (account a: trigger.new)
     {
             accids.add(a.id);
     }
     list<account> acclist = [select id,site,phone from account where id in :accids];
     for (account a: acclist)
     {
         if (a.site == 'Hyderabad')
         {
         a.phone = '1234567890';         
         }
         accountlist.add(a);   
     }
     
     system.debug('theRecurionHandling.allow value in recursion1 ' + theRecursionHandling.allow);
     if(theRecursionHandling.allow == true)
     {
     
     
     theRecursionHandling.allow = false;
     update acclist;
     }

}