trigger triggernow on Opportunity (before update) {
list <account> myacclist = new list<account>();
set <id> myids = new set <id>();
for(opportunity o: trigger.new)
{
myids.add(o.accountid);
}
list <account> triggeraccs = [select id,website,name, (select id,maincompetitors__c,account.name from opportunities) from account where id in :myids];
for(account a: triggeraccs)
{
for (opportunity o: a.opportunities)
{
a.website = o.account.name;
}
myacclist.add(a);
}
update myacclist;
}