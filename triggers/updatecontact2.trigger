trigger updatecontact2 on Contact (after update) {
public static boolean check = true;
list<id> contactids = new list<id>();
list<contact> clist = new list<contact>();
for (contact c: trigger.new)
{
contactids.add(c.id);
}

list<contact> conlist = [select id,assistantname from contact where id in :contactids];
for (contact c2 : conlist)
{
c2.assistantname = 'observor';
clist.add(c2);
}
if (check == true)
{
check = false;
update clist;
}

}