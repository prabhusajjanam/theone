/**
 * @description       : 
 * @author            : Prabhu Sajjanam
 * @group             : 
 * @last modified on  : 08-07-2020
 * @last modified by  : Prabhu Sajjanam
 * Modifications Log 
 * Ver   Date         Author            Modification
 * 1.0   08-07-2020   Prabhu Sajjanam   Initial Version
**/


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

//Adding this line in git hub

}
