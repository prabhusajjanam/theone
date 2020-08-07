public class passengerlogic{
list<passenger__c> palist = new list<passenger__c>();
public integer search_number_r = 0;
public integer search_number{get;set;}
integer myint=0;
public string passenger1 {get;set;}
public string passport1 {get;set;}
public string sex1 {get;set;}
public string from1 {get;set;}
public string to1 {get;set;}
public date traveld1 {get;set;}
public date returnd1 {get;set;}
public double cur1{get;set;}
public string passenger2 {get;set;}
public string passport2 {get;set;}
public string sex2 {get;set;}
public string from2 {get;set;}
public string to2 {get;set;}
public date traveld2 {get;set;}
public date returnd2 {get;set;}
public double cur2{get;set;}
public string passenger3 {get;set;}
public string passport3 {get;set;}
public string sex3 {get;set;}
public string from3 {get;set;}
public string to3{get;set;}
public date traveld3 {get;set;}
public date returnd3 {get;set;}
public double cur3{get;set;}


public pagereference insertmethod()
{
insert palist;
pagereference p = new pagereference('/apex/Passenger');
p.setredirect(true);
return p;
}

public integer getmyint()
{
if (search_number == null)
{
myint = 0;
return myint;
}
else
{
myint = search_number_r;
return myint;
}
}
public pagereference mylogic()
{
if (search_number > 3)
{
search_number_r = 0;
apexpages.addmessage(new apexpages.message(apexpages.severity.Error,'As of now you can enter 3 passenger details only'));
}
else
{
search_number_r = search_number;
}
if (search_number == 1)
{
passenger__c p1 = new passenger__c();
p1.name = passenger1;
p1.passport_number__C = passport1;
p1.sex__c = sex1;
p1.from__c = from1;
p1.to__c = to1;
p1.travel_date__c = traveld1;
p1.return_date__c = returnd1;
p1.payment_amount__c = cur1;
palist.add(p1);
}
if (search_number == 2)
{
passenger__c p2 = new passenger__c();
p2.name = passenger2;
p2.passport_number__C = passport2;
p2.sex__c = sex2;
p2.from__c = from2;
p2.to__c = to2;
p2.travel_date__c = traveld2;
p2.return_date__c = returnd2;
p2.payment_amount__c = cur2;
palist.add(p2);
}
if (search_number == 2)
{
passenger__c p3 = new passenger__c();
p3.name = passenger3;
p3.passport_number__C = passport3;
p3.sex__c = sex3;
p3.from__c = from3;
p3.to__c = to3;
p3.travel_date__c = traveld3;
p3.return_date__c = returnd3;
p3.payment_amount__c = cur3;
palist.add(p3);
}



return null;
}
}