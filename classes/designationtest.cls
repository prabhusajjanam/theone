@istest
public class designationtest{
@istest
public static void mytest()
{
// Creating Opportunity
opportunity opp = new opportunity();
opp.name = 'testclass1';
date d = Date.newInstance(2016,2,12);
opp.closedate= d;
opp.stagename = 'mystage';
insert opp;
// Creating top x designation
top_x_designation__c topx = new top_x_designation__C();
topx.name = 'destest';
topx.item_type__c = 'design1';
topx.document_attached__c = true;
topx.opportunity__c = opp.id;
system.debug('opportunity id is' +opp.id);
insert topx;
opportunity myopp = [select handsoff_attached__c from opportunity where id = :opp.id];
system.assertequals('Yes',myopp.handsoff_attached__C);

topx.item_type__c = 'design1';
topx.document_attached__C = false;
topx.opportunity__c = opp.id;
update topx;
system.debug('document attached is ' +topx.document_attached__C);
opportunity myopp2 = [select handsoff_attached__c from opportunity where id = :opp.id];
system.debug('myopp2 handsoff attached is ' +myopp2.handsoff_attached__c);
system.assertequals('No',myopp2.handsoff_attached__C);

delete topx;
opportunity myopp3 = [select handsoff_attached__c from opportunity where id = :opp.id];
system.assertequals(null,myopp3.handsoff_attached__C);

}
}