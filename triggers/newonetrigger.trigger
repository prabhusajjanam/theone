trigger newonetrigger on account (before insert) {

    for(account acc: trigger.new)
    {
         // acc.Industry = 'Agriculture';
    }
}