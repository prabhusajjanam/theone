public class assign3{
public static void myassign2method(list<opportunity> opplist){
datetime mydatetime;
date mydate;
list<id> myid = new list<id>();
list <datetime> datetimelist = new list<datetime>();
list <account> acc = new list<account>();
map<id,datetime> mymap = new map<id,datetime>();
for (opportunity o: opplist)
{
list<opportunity> opplist2 = [select accountid,createddate,deliveryinstallationstatus__c from opportunity where id = :o.id];
for (opportunity o2: opplist2)
{
myid.add(o2.accountid);
if (o2.deliveryinstallationstatus__c == 'Completed' || o2.deliveryinstallationstatus__c == 'In progress')
{
datetimelist.add(o2.createddate);
}
}
if (datetimelist.size() > 0)
{
mydatetime = datetimelist[0];
for (datetime d: datetimelist)
{
if (d > mydatetime)
{
mydatetime = d;
mymap.put(o.accountid,mydatetime);
}
}
}
list <account> accclist = [select id,latest_opportunity_creation_datetime__c from account where id = :myid];
for (account a: accclist )
{
a.latest_opportunity_creation_datetime__c = mymap.get(a.id);
acc.add(a);
}
update acc;
}
datetimelist.clear();
}
}