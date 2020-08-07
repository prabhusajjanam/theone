public class mysuperas1{

public static void contmethod(list<contact> conlist)
{
list<account> acc1 = new list<account>();
for (contact c: conlist)
{
if (c.accountid != null)
{ 
//HERE TOU ARE CERATING A NEW ACCOUNT WITH SAME ACCOUNT ID AS OF CONTACT PARENT ID....HOW EVER SALESFROCE
account acc2 = new account(id = c.accountid);
acc2.phone = c.phone;
acc1.add(acc2);
}
}
if (acc1 != null && acc1.size() > 0)
{
update acc1;
}
}
}