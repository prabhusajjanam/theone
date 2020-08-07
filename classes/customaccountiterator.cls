global class customaccountiterator implements iterator<account>
{
list<account> acclist {get; set;}
integer i {get; set;}

public customaccountiterator()
{
acclist = [select id from account];
i = 0;
}

global boolean hasnext()
{
if (i >= acclist.size())
{
return false;
}
else 
{
return true;
}
}

global account next()
{
i++;
return acclist[i];
}







}