public with sharing class CreateMutipleContactsController 
  {
    public List<Contact> conList{set;get;}
    public List<ContactWrapper> conWrapList{set;get;}
    private  String accid;
    public Integer noOfRows{set;get;}
    private integer rownumber=0;
    public integer deleterownumber{get;set;}
    public CreateMutipleContactsController ()
      {
        conList=new List<Contact>();
        conWrapList=new List<ContactWrapper>();
        //accid=Apexpages.currentpage().getParameters().get('accId');
        //System.debug('acc id is'+accID);
        //Contact con=new Contact(accountId=accid);
       // conList.add(con);
        
        ContactWrapper cw=new ContactWrapper(accid,rownumber++);
        conWrapList.add(cw);
      }
    
    public void addRow()
      {
       System.debug(noOfRows);
        for(integer i=0;i<noOfRows; i++)
        //conlist.add(new Contact(accountId=accid));
          conWrapList.add(new ContactWrapper(accid,rownumber++));
          system.debug('check this accid'+accid);
        
      
      }
   public Pagereference save()
     {
       //insert conList;
       List<Contact> conlist=new List<Contact>();
       for(ContactWrapper cw: conWrapList)
         {
           system.debug('cw.con.accountid is' +cw.con.accountid);
           conlist.add(cw.Con);
         
         }
       insert conList;
       return new Pagereference ('/'+accid);
     }
  public class ContactWrapper
    {
       public Contact con{set;get;}
       public Integer rowNumber{set;get;}
       
       public ContactWrapper(String accID, Integer rowNumber)
         {
           con=new Contact(AccountId=accId);
           this.rowNumber=rowNumber;
         }
    }
    public Pagereference Cancel()
    {
    return new Pagereference('/'+accId);
    }
    
    public void Delrow()
    {
    for(integer i=0;i<conWrapList.size();i++)
    {
     if(conWrapList[i].rowNumber==deleterownumber)
      conWrapList.remove(i);
     }
    }
  }