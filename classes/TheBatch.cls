public class TheBatch implements database.Batchable<sobject>,database.stateful {
    public final id myid = '0012800001W6wCO';
    public database.QueryLocator start(database.BatchableContext bc)
        {
            return database.getquerylocator('select id,(select id from contacts) from account where id =:myid');
        }
    public void execute(database.BatchableContext bc, list<account> scope)
    {   
        list<account> acclist = new list<account>();
        for(integer i = 0 ;i <= 300; i++)
        {     
            account acc = new account();
            acc.name = 'BatchAccountAttempt1'+'-'+i;
			acc.type = 'Prospect';
			acclist.add(acc); 
        }
        insert acclist;        
    }
    
    public void finish(database.BatchableContext bc)
    {
     	system.debug('finsih method');        
    }

}