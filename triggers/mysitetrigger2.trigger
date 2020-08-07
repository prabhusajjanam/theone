trigger mysitetrigger2 on Account (before insert,before update) {

if (trigger.isAfter && trigger.IsUpdate)
{
    AccountSite AS1 = new AccountSite();
    as1.mymethod(trigger.new);
}

if (trigger.isbefore && trigger.isinsert)
{



}

}