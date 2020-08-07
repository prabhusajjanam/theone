trigger simpletrigger on Opportunity (before delete) {
list<account> myacclist = new list<account>();
map <id,string> mymap = new map<id,string>();
set<id> myid = new set<id>();


//loop all opportunity old values which are going to get deleted and 
//collect the phone numbers of opportunities and put them in map with key as account id of that opportunity
//
//and also collect the account ids of accounts assosciated to that particular opportunity
for (opportunity o : trigger.old)
{
mymap.put(o.accountid,o.phone__c);
myid.add(o.accountid);
system.debug('accountid in first for loop is ' +o.accountid);
}

list<account> acc = [select id,phone from account where id in :myid];
// loop the accounts retrieved from above query and assign the phone number of opportunity to account phone 
for (account acc2: acc)
{
acc2.phone = mymap.get(acc2.id);
system.debug('opportunity phone is ' +mymap.get(acc2.id));
system.debug('account phone is ' +acc2.phone);
system.debug('account id is ' +acc2.id);
myacclist.add(acc2);
}
update myacclist;
}