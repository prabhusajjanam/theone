public class NewAndExistingController {

    public Account acc = new account();
    
    public account getacc(){ 
        system.debug('getAccount Invoked');
      //  Id id = ApexPages.currentPage().getParameters().get('prabhu');
      //  acc = (id == null) ? new Account() : 
       //     [SELECT Name, Phone, Industry FROM Account WHERE Id = :id];
                return acc;
    }
    
    public void setacc(Account acc){
        system.debug('setter ');
        this.acc = acc;
    }
   

    public NewAndExistingController() {
        
        system.debug('Constructor Invoked');
        
    }
    public PageReference savezTwo() {
        system.debug('Save method invoked Two');
       // try {
      //upsert(acc);
     //   } catch(System.DMLException e) {
     //       ApexPages.addMessages(e);
     //       return null;
    //    }
        //  After successful Save, navigate to the default view page
      //  PageReference redirectSuccess = new ApexPages.StandardController(Acc).view();
        return null;
    }
    public PageReference savez() {
        system.debug('Save method invoked');
       // try {
      //upsert(acc);
     //   } catch(System.DMLException e) {
     //       ApexPages.addMessages(e);
     //       return null;
    //    }
        //  After successful Save, navigate to the default view page
      //  PageReference redirectSuccess = new ApexPages.StandardController(Acc).view();
        return null;
    }
}