@isTest
public class MS_Opp_Batch_Trigger_Test {
    
    static testmethod void method1()
    {
        List<Opportunity> Opplist = new List<Opportunity>();
        account acc = new account();
        Id OppRectypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('FirstOppRecType').getRecordTypeId();

            For (Integer i = 0; i < 2200 ; i++)
            {
            Opportunity O = new Opportunity();
            O.Name = 'BatchOpp'+i;
            O.amount = 1;
            O.Type = 'New Customer';
            O.CloseDate = date.parse('12/30/2017');
            O.StageName = 'New';
            O.recordtypeid = OppRectypeId;
            Opplist.add(O);
            }


            database.insert(OppList);
    }

}