@isTest
private class AccountProcessorTest{
    @IsTest
    private static void testCountContacts(){
         Account acc = new Account(Name = 'TestAcc2');
         Insert acc;
         
         Contact con = new Contact(LastName = 'TestCont2', AccountId = acc.Id);
         Insert con;
         
         List<Id> lstOfAccIds = new List<Id>();
         lstOfAccIds.add(acc.Id);
         Test.startTest();
             AccountProcessor.countContacts(lstOfAccIds);
         Test.stopTest();
  
    }
}