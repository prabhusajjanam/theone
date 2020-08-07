public class pgref_logic_comb2
{
list <account> acts;
public pgref_logic_comb2(apexpages.standardcontroller myext){}
public list<account> getacts()
{
return acts;
}
public pagereference directacts()
{
acts = [select name,type,industry,phone,fax from account where type = 'customer - direct'];
return null;
}
}