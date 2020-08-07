public class AccountProcessor{
    @future
    public static void countContacts(List<Id> accId){
        List<Account> lstOfAccounts = [Select Id, Number_of_Contacts__c, (Select Id from Contacts) from Account Where Id IN :accId];
        
        List<Account> lstOfAcc = new List<Account>();        
        for(Account acc : lstOfAccounts){
            if(acc != null){
                Integer contCount = 0;
                if(acc.Contacts != null && acc.Contacts.size()> 0)
                    contCount = acc.Contacts.size();
                    
                acc.Number_of_Contacts__c = contCount;
                lstOfAcc.add(acc);
            }
        }
        Update lstOfAcc;
    }
}