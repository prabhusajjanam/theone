trigger consalsum on Contact (after insert,after update) {
list<id> conaccids = new list<id>();
list<account> acclist2 = new list<account>();
decimal myint = 0;
// get all contact ids
for(contact c: trigger.new)
{
conaccids.add(c.accountid);
}
// get all related account for the above contact ids
list<account> acclist = [select id,total_contacts_salary__c,(select salary__c from contacts) from account where id in :conaccids];
// inserting/summing up the salary of contacts to account total contacts salary field
for (account a: acclist)
{
for (contact con: a.contacts)
{
system.debug('salary is' +con.salary__c);
myint += con.salary__c;
}
a.total_contacts_salary__c = myint;
myint = 0;
acclist2.add(a);
}
update acclist2;
}