public class myfinalas1{
public static void mymethod(list <contact> conlist)
{
list <account> acc = new list <account>();
set <id> myid = new set<id>();
for(contact c: conlist)
{
myid.add(c.accountid);
}
list<account> acc2 = [select id,phone,(select id,phone from contacts) from account where id in :myid];
list<contact> v=[select phone from contact where accountid in:myid limit 1];
//system.debug('cons are'+v.size());
//system.debug(+v[2].phone);
for (account a: acc2)
{
system.debug(+a.contacts);
//for (contact c2:v)


//{
a.phone = v[0].phone;
//}
acc.add(a);
}
if(acc != null)
{
update acc;
}
}
//system.debug(+a.contacts);
}