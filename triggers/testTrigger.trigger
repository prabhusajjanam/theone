trigger testTrigger on account (before insert) {
    for(account acc : trigger.new)
    {
        acc.Industry = 'Banking'; 
    }
}