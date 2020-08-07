public with sharing class simplebatch2 {
public batch__c mybatch {get;set;}
public simplebatch2()
{
mybatch = new batch__C();
}

public pagereference save(){
insert mybatch;
return null;
}
}