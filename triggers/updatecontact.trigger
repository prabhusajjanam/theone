trigger updatecontact on Contact (before update,before insert,after update,after insert) {

for(contact c: trigger.new)
{  
    if(trigger.isupdate)
    {
     if(trigger.isbefore)
     {
        system.debug('trigger.isbeforeupdate');
     }
     if(trigger.isafter)
     {
        system.debug('trigger.isafterupdate');
     }
    }
    if(trigger.isinsert)
    {
         if(trigger.isbefore)
     {
        system.debug('trigger.isbeforeinsert');
     }
     if(trigger.isafter)
     {
        system.debug('trigger.isafterinsert');
     }
    }

    if (trigger.isbefore)
    {
    if(c.phone == '123')
    {
    system.debug('now1 department ' +c.department);
       if (c.department == 'updatedbyworkflow'|| c.fax == '123')
       {
            system.debug('now2 department ' +c.department);
            system.debug('now2 fax ' +c.fax);
            c.department = 'notupdated';
            C.fax = '123';
            
            if(c.assistantname == 'observorbyworkflow')
            {
               system.debug('now2 before change salary ' +c.salary__c);
               c.salary__c = 100;
               system.debug('now2 after change salary ' +c.salary__c);
            }
       }
       else
       {
           c.languages__c = 'English';
       }
       system.debug('after completion of before insert department is ' +c.department);
    }
    }
}


}