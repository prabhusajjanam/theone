trigger myopptrigger2 on Account (after update,after insert) {
list<id> accids = new list<id>();
list<opportunity> myopp = new list<opportunity>();
//map<id,string> mymap = new map<id,string>();
for(account a: trigger.new)
{
accids.add(a.id);
//mymap.put(a.id,a.phone);
}
    list <account> acclist = [select id,phone,(select id,phone__c from opportunities) from account where id in :accids];

for (account a2: acclist)
{
for (opportunity o: a2.opportunities)
{
//o.phone__c = mymap.get(a2.id);
o.phone__c = a2.phone;
myopp.add(o);
}
}
if(recursionhandler2.check())
{
update myopp;
}
}