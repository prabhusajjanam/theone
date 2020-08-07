public with sharing class Accountdetails {
public id selectedid{get;set;}
public list<selectoption> accso{get;set;}
public list<contact> conlist{get;set;}
public boolean renderflag{get;set;}
list<account> acc;
    public Accountdetails(ApexPages.StandardSetController controller) {
    renderflag = false;
    accso = new list<selectoption>();
    acc = [select id,name from account limit 5];
    for (account a:acc)
    {
    accso.add(new selectoption(a.id,a.name));    
    }
    }
    //ADDED ONE LINE



public void mymethod1()
{
renderflag = true;
id myid = selectedid;
conlist = [select lastname,phone from contact where accountid = :myid];
}    
    

}