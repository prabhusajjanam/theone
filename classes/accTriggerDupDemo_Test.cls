@isTest
public class accTriggerDupDemo_Test {
	@isTest
    static void testme(){
        Account a1=new Account(Name='Test');
        insert a1; //Every dml statement is a separate transaction (it can be single record or list of records)
        Integer count=[select count() from Account];
        Account a2=new Account(Name='Test');
        try{
            insert a2; //another transaction
        }catch(Exception e){
            System.debug(e);
        }
        Integer size=[select count() from Account];
        System.assertEquals(count,size);
    }
    
    @isTest
    static void testme2(){
        Account a1=new Account(Name='Test');
        insert a1; //Every dml statement is a separate transaction (it can be single record or list of records)
        Integer count=[select count() from Account];
        Account a2=new Account(Name='Test');
        try{
            insert a2; //another transaction
        }catch(Exception e){
            System.debug(e);
        }
        Integer size=[select count() from Account];
        System.assertEquals(count,size);
    }
    
    @isTest
    static void testme3(){
        Account a1=new Account(Name='Test');
        insert a1; //Every dml statement is a separate transaction (it can be single record or list of records)
        Integer count=[select count() from Account];
        Account a2=new Account(Name='Test');
        try{
            insert a2; //another transaction
        }catch(Exception e){
            System.debug(e);
        }
        Integer size=[select count() from Account];
        System.assertEquals(count,size);
    }
}