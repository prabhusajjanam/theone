public with sharing class noofclicks {
public integer clicks{get;set;}
public noofclicks()
{
clicks = 0;
}
public pagereference myclicks()
{
clicks++;
system.debug('Flow is coming here and value of clicks is '+clicks);
return null;
}

}