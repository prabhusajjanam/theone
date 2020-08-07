public with sharing class dquery {
public list<selectoption> acclist {get;set;}
public string selectedaccount1 {get;set;}
public string selectedaccount2 {get;set;}
public boolean renderflag1 {get;set;}
public boolean renderflag2 {get;set;} 
public boolean conrender1 {get;set;}
public boolean conrender2 {get;set;} 
public account acc1 {get;set;}
public account acc2 {get;set;}
public list<contact> conlist1 {get;set;}
public list<contact> conlist2 {get;set;}
public id myid1;
public id myid2;
public dquery(){
renderflag1 = false;
renderflag2 = false;
conrender1 = false;
conrender2 = false;
acclist = new list<selectoption>();
acclist.add(new selectoption('','None'));
acclist.add(new selectoption('xyz1','xyz1'));
acclist.add(new selectoption('xyz2','xyz2'));
acclist.add(new selectoption('xyz3','xyz3'));
}
public pagereference display1()
{

system.debug('selectedaccount1' +selectedaccount1);
if (selectedaccount1 == null)
{
apexpages.addmessage(new apexpages.message(apexpages.severity.error,'Select any account'));
}
else
{
renderflag1 = true;
string searchquery1 = 'select id,name,phone,fax from account where name = :selectedaccount1';
acc1 = database.query(searchquery1);
myid1 = acc1.id;
}
return null;
}

public void condisplay1(){
system.debug('myid1 is' +myid1);
if (selectedaccount1 == null)
{
apexpages.addmessage(new apexpages.message(apexpages.severity.error,'Select any account'));
}
else
{
conrender1 = true;
string searchquery1 = 'select id,name,phone,fax from account where name = :selectedaccount1';
acc1 = database.query(searchquery1);
myid1 = acc1.id;
string conquery1 = 'select lastname,phone,fax from contact where accountid = :myid1';
conlist1 = database.query(conquery1);
}
}

public pagereference display2()
{

system.debug('selectedaccount2' +selectedaccount2);
if (selectedaccount2 == null)
{
apexpages.addmessage(new apexpages.message(apexpages.severity.error,'Select any account'));
}
else
{
renderflag2 = true;
string searchquery2 = 'select name,phone,fax from account where name = :selectedaccount2';
acc2 = database.query(searchquery2);
myid2 = acc2.id;
}
return null;
}

public void condisplay2(){
if (selectedaccount2 == null)
{
apexpages.addmessage(new apexpages.message(apexpages.severity.error,'Select any account'));
}
else
{
conrender2 = true;
string searchquery2 = 'select name,phone,fax from account where name = :selectedaccount2';
acc2 = database.query(searchquery2);
myid2 = acc2.id;
string conquery2 = 'select lastname,phone,fax from contact where accountid = :myid2';
conlist2 = database.query(conquery2);
}
}

}