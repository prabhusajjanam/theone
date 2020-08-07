trigger Update_Contact_Phone_For_College on college__c (before insert,before update) {
    
   // trigger.new[0].Contact_Phone_Using_Trigger__c = '123';
   for(college__c clg : trigger.new)
   {
       system.debug('College Name for this instance is '+clg.Name);
       clg.Contact_Phone_Using_Trigger__c = '123';
   }
}