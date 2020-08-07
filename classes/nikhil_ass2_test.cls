@istest
public class nikhil_ass2_test {
    static testmethod void testmethod1(){
        id profileid =[select id from Profile where name = 'system Administrator' limit 1].id;
        user myuser = [select id from user where id = '00528000001ZzCj'][0]; 
        system.runAs(myuser){
            contact mycontact = new contact(lastname = 'something',department='Prabhu',mobilephone='6789');
            database.insert(mycontact);
            mycontact.department = 'nikhil';
            mycontact.MobilePhone = '1234';
            
                database.update(mycontact);
                system.assertEquals(mycontact.fax, '1234') ;  
            
        }
            
        
        
        
    }
    

}