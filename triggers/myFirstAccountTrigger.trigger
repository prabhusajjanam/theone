trigger myFirstAccountTrigger on account (before insert) {
//Updating/Defaulting INDUSTRY = Banking
    for(account acc: trigger.new)
    {
        //acc.Industry = 'Banking';
       // acc.Phone = '1231231231';
    }

}