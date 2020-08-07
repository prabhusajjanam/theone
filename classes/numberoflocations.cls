public class numberoflocations{
public static void createcontacts(list<account> acclist)
{
list<contact> conlist = new list<contact>();
map<id,decimal> mymap  = new map<id,decimal>();
for (account a: acclist)
{
mymap.put(a.id,a.Number_of_locations__c);
}
for (id accid:mymap.keyset())
{
for( integer i = 1;i<=mymap.get(accid);i++)
{
contact con = new contact();
con.accountid = accid;
con.lastname = 'contact'+i;
conlist.add(con);
}
}
insert conlist;
}
}