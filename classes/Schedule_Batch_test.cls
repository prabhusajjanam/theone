global class Schedule_Batch_test implements schedulable {
    
    global void execute(schedulableContext sc)
    {
        database.executeBatch(new batch_test(),1);
    }

}