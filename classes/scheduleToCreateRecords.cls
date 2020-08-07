global class scheduleToCreateRecords implements schedulable
{
global void execute(schedulablecontext sc)
{
batchtocreaterecords b = new batchtocreaterecords();
database.executebatch(b); 
}

}