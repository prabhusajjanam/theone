public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer noofcontacts, String LName){
        List<Contact> cons = new List<Contact> ();
        for(Integer i=0; i< noofcontacts; i++ ){
            cons.add(new Contact (FirstName = 'Test' + i,LastName = Lname));
             }
       // system.debug(cons);
       return cons;
     }
}