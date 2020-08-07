trigger updatesalesrep on Account (before insert,before update) {
set<id>  accowner = new set<id>();
for (account a : trigger.new)
{
accowner.add(a.ownerid);
}
map<id,user> usermap = new map<id,user>([select name from user where id in :accowner]);

for (account acc: trigger.new)
{
set <id> myid;
myid = usermap.keyset();
system.debug('id in map is '+myid);
user usr = usermap.get(acc.ownerid);
acc.sales_representative__c = usr.name;
system.debug('id in account i.e. owner id is ' +acc.ownerid);
}




}