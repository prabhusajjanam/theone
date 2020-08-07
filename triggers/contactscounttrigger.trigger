trigger contactscounttrigger on contact (after insert, after update) {
list<id> accountids = new list<id>();
integer count = 0;
for (contact c: trigger.new)
{
accountids.add(c.accountid);
}
system.debug('ha ha' +accountids[0]);
list<account> acclist = [select id,contacts_count__c,(select id from contacts) from account where id in :accountids];
for (account a:acclist)
{
system.debug('ho ho');
for (contact c:a.contacts)
{
count = count + 1;
system.debug('count' +count);
}
a.contacts_count__c = count;
}
update acclist;
}