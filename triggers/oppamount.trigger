trigger oppamount on Opportunity (before update,before insert) {

if(trigger.isupdate || trigger.isinsert)
{
set<id> accids = new set<id>();
map<id,decimal>  mymap = new map<id,decimal>();
for (opportunity o: trigger.new)
{
accids.add(o.accountid);
}
list<account> acclist = [select id,(select id,amount from opportunities) from account where id in :accids];
for(account a: acclist)
{
for(opportunity op: a.opportunities)
{
mymap.put(a.id,op.amount);
}

}





}

}