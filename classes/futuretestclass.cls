public class futuretestclass implements Queueable{
    
    private set<string> accountIds;
    
       
    public futuretestclass(set<string> accountIds) {
        this.accountIds = accountIds;
    }
    
    public void execute(QueueableContext context) {
        list<account> acclist = [select id,futuretest__c from account where id in :accountIds];
        for(account a : acclist)
        {
            a.futuretest__c = true;
        }
        update acclist;
    }
    

}