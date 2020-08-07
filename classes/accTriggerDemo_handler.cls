public class accTriggerDemo_handler {
    
    public  void setDescriptionBasedonIndustry(list<account> inputAccList)
    {
        for(account acc: inputAccList)
        {
            if(acc.industry == 'Banking')
                acc.description = 'Important account';
        }
    }
    
    public static string secondMethod(list<account> newRecords, list<account> oldRecords,Map<id,account> newRecordsMap)
    {
        string returnstatement = 'success';
       //logic
       return returnstatement;
    }
    
}