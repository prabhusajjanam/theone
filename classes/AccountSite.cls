public class AccountSite{

public void mymethod(list<account> acclist)
{
    system.debug('trigger invoked');
    for (account a: acclist)
    {
      a.My_Site__c = a.site;
      system.debug('account site is ' + a.site);
    
    }
}



}