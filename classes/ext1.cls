public class ext1
{

public ext1(Apexpages.standardController controller){}
list<campaign> camps=[select name,startdate,Enddate,budgetedcost from campaign];

public list<campaign> getcamps()
{

return camps;

}

}