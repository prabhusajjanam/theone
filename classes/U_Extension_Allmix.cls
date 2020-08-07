public class U_Extension_Allmix{

public id accountid{get;set;}
public integer rownumber{get;set;}
public wrapper thewrapper{get;set;}
public boolean renderflag{get;set;}
public list<wrapper> wrapperlist{get;set;}
public integer deleterownumber{get;set;}
public integer addquantity{get;set;}
public boolean Outputtext{get;set;}
public Apexpages.standardcontroller standardcon;

public U_Extension_Allmix(Apexpages.standardcontroller ctrl)
{
//Contact Con = (contact)ctrl.getrecord();
//system.debug('contact is ' +con);
standardcon = ctrl;
rownumber = 0;
}

Public void Save()
{
list<contact> contlist = new list<contact>();
for (wrapper w21: wrapperlist)
{
system.debug('w21con is' + w21.thecon);
contact cont1 = new contact();
cont1 = w21.thecon;
contlist.add(cont1);
}
try{
system.debug('Contlist is ' +contlist);
insert contlist;
Outputtext = true;
}
catch(exception e)
{
system.debug('exception is' +e);
}
}

public pagereference cancel()
{
return new pagereference('/'+accountid);
}

public void logicmethod()
{
contact cont = (contact)standardcon.getrecord();
accountid = cont.accountid;
renderflag = true;
rownumber++;
wrapper wrap = new wrapper(accountid,rownumber);
wrapperlist = new list<wrapper>();
wrapperlist.add(wrap);

}



Public void rem()
{
system.debug('wrapperlist is ' +wrapperlist);
for(integer i = 0; i < wrapperlist.size(); i++)
{
system.debug('i value is ' +i);
system.debug('deleterownumber value is ' +deleterownumber);

if (wrapperlist[i].therownumber == deleterownumber)
{

wrapperlist.remove(i);

}
}
}


public void add()
{
for (integer i = 0; i < addquantity ; i++)
{
rownumber++;
system.debug('rownumber is ' +rownumber);
wrapper w2 = new wrapper(accountid,rownumber);
wrapperlist.add(w2);
system.debug('wrapperlist is ' +wrapperlist);
}

}


public class wrapper{
public integer therownumber{get;set;}
public contact thecon{get;set;}
public wrapper(id accid,integer myint)
{
this.thecon = new contact(accountid = accid);
this.therownumber = myint;
}
}



}