public class nikhil_ass2 {
public static void mymethod(list<contact> conlist,map<id,contact> oldvaluesmap)
{
    for (Contact c:conlist)
{
   if(c.Department=='nikhil'&& oldvaluesmap.get(c.id).Department=='Prabhu')
   {
       
       c.Fax = c.MobilePhone;
    }
    
    if(string.isblank(c.MobilePhone))
    {
        c.mobilephone.adderror('mobilephone is required');
    }
    
}
}
}