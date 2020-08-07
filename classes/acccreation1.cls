public class acccreation1{

public static void accmethod(list<account> acclist)
{
list<contact> conlist = new list<contact>();
for (Account a:acclist)
{
for (integer i = 0;i<4;i++)
{
contact c = new contact();
c.lastname = 'Laxman'+i;
c.accountid = a.id;
conlist.add(c);
}
}
insert conlist;
}
}