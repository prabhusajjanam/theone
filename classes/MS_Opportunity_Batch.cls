global class MS_Opportunity_Batch implements Database.Batchable<sobject> {
    
    global final Set<Id> InputOppIds;
    
    global MS_Opportunity_Batch(Set<Id> InputOIds){
         InputOppids = InputOids;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([select id,nextstep from opportunity where Id in :InputOppIds ]);
    }
    
    global void execute(Database.BatchableContext BC, List<Opportunity> scope){
       for(Opportunity O:Scope)
       {
           O.nextstep = 'batchtest';
       }
       Update Scope;
    }
    
    global void finish(Database.BatchableContext BC){
    }
    
}