public class urclass {
        public void urmethod(){
                    list<contact> conlist = [select firstname,lastname,accountid from contact limit 10];
        list<string> acc = new list<string>();
        for(contact c:conlist){
            acc.add(c.accountid);
                system.debug('this is acc'+acc);
        }
         list<account> acn =[select name from account where id  in : acc];
            for(account name:acn){
                system.debug('this actual acn'+acn);
            }
        
    }

}