public class myas1{
public static void myasmethod(list<contact> conlist)
{
list<account> acc2 = [select id,phone from account];
list<account> acc = new list<account>();
map<id,string> m = new map<id,string>();
for (contact c: conlist)
{
m.put(c.account.id,c.phone);
for (account a: acc2)
{
string tphone = m.get(a.id);
if (a.id == c.account.id)
{
a.phone = tphone;
acc.add(a);
}
}
}
update acc;
}
}