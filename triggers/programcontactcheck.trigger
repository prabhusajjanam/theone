trigger programcontactcheck on Program__c (before insert) 
{
for (program__c p: trigger.new)
    { 
      System.debug('fax' +p.contact__r);
      If (p.contact__r.fax != '12345')
      {
       p.adderror('Select different contact');
      }
    }
}