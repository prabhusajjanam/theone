public class pageblock_tab{
list<account> channel_acts = [select name,type,industry,phone,fax from account where type = 'customer - channel'];
list<account> direct_acts = [select name,type,industry,phone,fax from account where type = 'customer - direct'];

public list<account> getchannel_acts()
{
return channel_acts;
}
public list<account> getdirect_acts()
{
return direct_acts;
}
}