trigger studentstatus on Student__c ( before update) {
    
    
    for(student__c s : trigger.new)
    {
        student__c oldstudent = trigger.oldMap.get(s.Id);
        if(s.Approval_Status__c != oldstudent.Approval_Status__c && !s.ignoreError__c)
        {
            s.addError('You cannot Edit this field');
            s.ignoreError__c = false;
        }
        s.ignoreError__c = false;
    }
    

}