public class wrapperclassdemo2{
string mystring;
list<id> myid = new list<id>();
list <mywrapperclass> mywrp = new list<mywrapperclass>();
public list<mywrapperclass> wrapperlist{get;set;}
public wrapperclassdemo2(apexpages.standardcontroller controller)
{
}

public list<mywrapperclass> getactualwrappermethod()
{
list<account> acc2 = [select id,name,(select lastname from contacts) from account limit 5];
wrapperlist = new list<mywrapperclass>();
for (account a2: acc2)
{
for (contact c1: a2.contacts)
{
wrapperlist.add(new mywrapperclass(a2,c1,false));
}
}
return wrapperlist;
}

public pagereference calcmethod()
{
for (mywrapperclass abc: wrapperlist)
{
if (abc.checkbox == true)
{
mywrp.add(abc);
myid.add(abc.acc.id);
system.debug('account id may be' +abc.acc.id);
}
}
system.debug('size of checkboxes is ' +mywrp.size());
if (mywrp.size() == 1)
{
system.debug('pagereference id is '+myid[0]);
return new pagereference ('/'+myid[0]);
}
else
{
apexpages.addmessage(new apexpages.message(apexpages.severity.ERROR,'Please select one check box only'));
system.debug('yes it is coming here ');
return null;
}

}
public class mywrapperclass{

public account acc{get;set;}
public contact cont{get;set;}
public boolean checkbox{get;set;}

public mywrapperclass(Account arec,contact con,boolean cbox)
{
acc = arec;
cont = con;
checkbox = cbox;
}
}
}