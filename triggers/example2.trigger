trigger example2 on Contact (before insert) {

    for(Contact c:Trigger.New){

        if(c.leadsource=='Web' && 

            (c.accountId==''||c.accountId==null)){

     c.addError('Web contact cannot be created with out account');

        }
    }
}