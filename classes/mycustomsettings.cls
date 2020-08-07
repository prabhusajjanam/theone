public with sharing class mycustomsettings {
public string selectedvalue {get;set;}
public list<selectoption> myisocodes{
get
{
list <selectoption> options = new list<selectoption>();
for(countrycodes__C ccodes: countrycodes__c.getall().values())
{
options.add(new selectoption(ccodes.iso_code__c,ccodes.name+'-'+ccodes.iso_code__c));
}
return options;
}
set
{
system.debug('selected value is ' +selectedvalue);
}
}
public void mymethod(){
map<string,countrycodes__c> mycountrycodes = countrycodes__c.getall();
system.debug('iso code for INDIA is ' +mycountrycodes.get('INDIA').iso_code__c);
countrycodes__c mycode = countrycodes__c.getinstance('CANADA');
system.debug('iso code for CANADA is ' +mycode.iso_code__c);
}



}