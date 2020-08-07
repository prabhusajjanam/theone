public class wrapperclassdemo{

public list<mywrapperclass> wrapperlist{get;set;}
public wrapperclassdemo(apexpages.standardcontroller controller)
{
}

public list<mywrapperclass> getactualwrappermethod()
{
list<account> acc2 = [select id,name from account limit 20];
wrapperlist = new list<mywrapperclass>();
for (account a2: acc2)
{
wrapperlist.add(new mywrapperclass(a2,false));
}
return wrapperlist;
}
public class mywrapperclass{

public account acc{get;set;}
public boolean checkbox{get;set;}

public mywrapperclass(Account arec,boolean cbox)
{
acc = arec;
checkbox = cbox;
}


}

}