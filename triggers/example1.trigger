trigger example1 on Account (before insert) {
    
for(account a:trigger.new)
{
    if(a.industry=='banking')
    {
        a.annualrevenue=100000;
    }
    if(a.industry=='energy')
    {
        a.annualrevenue=50000;
    }
}
}