public class contactrelationship{
public static void mycontactrelationship(list<contact> conlist)
{
list<custom_relationship__c> crlist = new list<custom_relationship__C>();
for (contact c:conlist)
{
if (c.contact_relationship__c == true)
{
custom_relationship__C cr = new custom_relationship__C();
cr.name = c.lastname;
cr.contact__c = c.id;
crlist.add(cr);
}
}
insert crlist;
}
}