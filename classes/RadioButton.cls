public class RadioButton {
List<contact> selectcon;
List<contactWrap> allContactsWrap = new List<ContactWrap>();
Map<String,Contact> allContactsMap = new Map<String,Contact>();

//This is a wrapper class which contains a boolean flag and a associated contact, the flag is used to denote if the contact was selected
public class contactWrap{
    public boolean isSelected {get;set;}
    public contact con {get;set;}
    public contactWrap(boolean s,contact c){
        isSelected = s;
        con = c;
    }
}
/* This function is called when the page loads. The SOQL query gets 5 contacts and puts them in the wrapper class variable.
   It sets the flag to FALSE by default, since no contacts are selected when the page loads
*/   
public void onloadFunction(){
    for(Contact c:[Select Id,FirstName,LastName,Email,Phone from Contact limit 5]){
         allContactsWrap.add(new contactWrap(false,c));
         allContactsMap.put(c.Id,c);
    }
}
        
Public List<contactWrap> getAllContacts()
{            
    return allContactsWrap;
}

/* This function  is called when a radio button is clicked */    
Public void selectcon()
{
    String selcontactid = System.currentPagereference().getParameters().get('conid');                //Get the ID of the selected contact
    integer indexVal = Integer.valueof(system.currentpagereference().getparameters().get('index'));  //Get the index (row number) of the selected contact
    Contact con = allContactsMap.get(selcontactid);
    selectcon =  new List<contact>();
    selectcon.add(con);
    //Using the index, set the boolean flag on the wrapper class variable to TRUE, all other rows are set to FALSE
    for(integer i=0; i < allContactsWrap.size(); i++)
        if(i == indexVal - 1)
            allContactsWrap[i].isSelected = true;
        else
            allContactsWrap[i].isSelected = false;
}
Public List<contact> getselectedContact()
{
    return selectcon;
}
}