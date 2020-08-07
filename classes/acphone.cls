public class acphone{
public static void acmethod(list <account> acctlist)
{
list<contact> con = new list <contact>();
set<id> myid = new set<id>();
for(account a: acctlist)
{
myid.add(a.id);
}
list<account> acc2 = [select id,phone,(select id,phone from contacts) from account where id in :myid];
for (account a: acc2)
{
for(contact c: a.contacts)
{
c.phone = a.phone;
con.add(c);
}
}
if (con != null)
{
update con;
}
}
}