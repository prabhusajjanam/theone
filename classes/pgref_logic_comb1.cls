public class pgref_logic_comb1
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
}