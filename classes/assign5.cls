public class assign5{
public static void myassign2method(list<opportunity> opplist){
datetime mydatetime;
date mydate;
list<id> myid = new list<id>();
list <datetime> datetimelist = new list<datetime>();
set<id> myid2 = new set<id>();
list <account> acc = new list<account>();
map<id,datetime> mymap = new map<id,datetime>();
for (opportunity o: opplist)
{
myid2.add(o.id);
}
list<opportunity> opplist2 = [select id,accountid,createddate,deliveryinstallationstatus__c from opportunity 
where id = :myid2 ];
for (opportunity o2: opplist2)
{
myid.add(o2.accountid);
for (integer k = 0;k<10;k++)
{
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
mymap.put(o2.accountid,mydatetime);
}
else
{
mymap.put(o2.accountid,mydatetime);
}
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
}