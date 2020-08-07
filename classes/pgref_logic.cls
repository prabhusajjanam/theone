public class pgref_logic
{
list <account> acts;

public list<account> getacts()
{
return acts;
}

public pagereference channelacts()
{
acts = [select name,type,industry,phone,fax from account where type = 'customer - channel'];
return null;
}
public pagereference directacts()
{
acts = [select name,type,industry,phone,fax from account where type = 'customer - direct'];
return null;
}
}