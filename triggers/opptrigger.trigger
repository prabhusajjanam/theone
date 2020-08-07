trigger opptrigger on Account (after update) {
list<id> accids = new list<id>();
for(account a: trigger.new)
{
accids.add(a.id);
}
list<account> acclist = [select id,phone,(select id,phone__c from opportunities) from account where id in :accids];

for (account ac: acclist)
{
for (opportunity op:ac.opportunities)
{
op.phone__c = ac.phone;
}
}
if(recursionhandler2.check())
{
update acclist;
}
}