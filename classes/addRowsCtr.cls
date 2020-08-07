public class addRowsCtr {
    
    public list<contact> contacts;
    
    Public List<contact> getContacts(){
        contacts = [select id,name,email from contact limit 2];
        return contacts;
    }
    
    public void addRow(){
        contacts.add(new contact(firstname = 'something'));
    }
    
    Public class ContactWrapper

    {
    Public Contact con{get;set;}
    public ContactWrapper(Contact c)
        
    {
        this.con = c;
    }
}
    
}