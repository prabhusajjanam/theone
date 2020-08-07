trigger accountTrigger_Demo on account (before insert) {
    for(account acc: trigger.new)
    {
        acc.Industry = 'Banking';
        acc.Phone = '1231231231';
    }
}