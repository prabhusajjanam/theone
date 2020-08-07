public with sharing class contact2 {

 public List<ContactWrapper> wrappers {get; set;}
 public static Integer toDelIdent {get; set;}
 public static Integer addCount {get; set;}
 private Integer nextIdent=0;

    public contact2(ApexPages.StandardController controller) {    
      wrappers=new List<ContactWrapper>();
      for (Integer idx=0; idx<3; idx++)
      {
       wrappers.add(new ContactWrapper(nextIdent++));
      }
  }      

 public void delWrapper()
 {
  Integer toDelPos=-1;
  for (Integer idx=0; idx<wrappers.size(); idx++)
  {
   if (wrappers[idx].ident==toDelIdent)
   {
    toDelPos=idx;
   }
  }
   
  if (-1!=toDelPos)
  {
   wrappers.remove(toDelPos);
  }
 }
  
 public void addRows()
 {
  for (Integer idx=0; idx<addCount; idx++)
  {
   wrappers.add(new ContactWrapper(nextIdent++));
  }
 }
    
public PageReference save()
 {
  List<Contact> Cons=new List<contact>();
  for (ContactWrapper wrap : wrappers)
  {
   cons.add(wrap.con);
  }
  insert cons;
  return new PageReference('/' + Schema.getGlobalDescribe().get('contact').getDescribe().getKeyPrefix() + '/o');
 }    
    
public class ContactWrapper
 {
  public Contact con {get; private set;}
  public Integer ident {get; private set;}
   
  public ContactWrapper(Integer inIdent)
  {
   ident=inIdent;
   Con=new Contact();
  }
  }

}