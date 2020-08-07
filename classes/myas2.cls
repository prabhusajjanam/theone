public class myas2{
public static void myasmethod(list<contact> conlist)
{
list<account> acc = new list<account>();
map<id,string> m = new map<id,string>();
for (contact c: conlist)
{
string myid = c.accountid;
m.put(c.accountid,c.phone);
list<account> acc3 = [select id,phone from account where id = :myid];
for (account a: acc3)
{
string tphone = m.get(a.id);

a.phone = tphone;

acc.add(a);
}

}
update acc;
}
}