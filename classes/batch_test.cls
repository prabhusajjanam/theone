global class batch_test implements Database.Batchable<sObject>,database.stateful {
    global Integer Normalvalue = 0;
    static Integer Staticvalue =0;
    
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
    
        //Normalvalue = 0;
        //StaticValue = 0;
        
        System.debug('Before normal value in start' + normalvalue);
        System.debug('Before static value in start' + staticvalue);
        normalvalue++;
        staticvalue++;
        System.debug('normal value in start' + normalvalue);
        System.debug('static value in start' + staticvalue);
        
        return database.getquerylocator([SELECT NAME from ACCOUNT WHERE name like 'thebatch%']);
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope) {
        //Normal this will print 2 the first execution, and so on...
        //Static this will print 1 and not 2 
        
        System.debug('Before normal value in execute ' + normalvalue);
        System.debug('Before static value in execute ' + staticvalue);
        normalvalue++;
        staticvalue++;
        System.debug('After normal value in execute ' + normalvalue);
        System.debug('After static value in execute ' + staticvalue);
        
    }

    global void finish(Database.BatchableContext BC) {
        //Normal this will print 2 + however many batches were executed
        //Static this will print 1 
        
        System.debug('Before normalvalue in finish ' +normalvalue);
        System.debug('Before static value in finish ' +staticvalue);
        normalvalue++;
        staticvalue++;
        System.debug('After normalvalue in finish ' +normalvalue);
        System.debug('After static value in finish ' +staticvalue);
   }
}