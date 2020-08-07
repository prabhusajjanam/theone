public with sharing class contactslogicclass2{
public list<contactwrapper> conwraplist{set;get;}
public boolean renderflag{get;set;} 
//public apexpages.standardcontroller standardcon;
private integer rownumber =0;
public integer noofrows{set;get;}
public id theaccountid{get;set;}
public integer deleterownumber{get;set;}
public contact con1{get;set;}
string accid{get;set;}

public contactslogicclass2(apexpages.standardcontroller con)
{
contact con1 = (contact)con.getrecord();
renderflag = false;
//standardcon = con;
}

public void contactslogic()
{
renderflag = true;
//accid=Apexpages.currentpage.getparameters.get('accid');
accid=Apexpages.currentpage().getParameters().get('accId');
conwraplist = new list<contactwrapper>();
system.debug('renderflag is' +renderflag);
contact con1=new contact(accountid=accid);

//contact con1 = (contact) standardcon.getrecord();
//system.debug('contact account id is '+con1.accountid);
//theaccountid = con1.accountid;
//system.debug ('theaccountid is '+theaccountid);
contactwrapper cw1 = new contactwrapper(accid,rownumber++);
conwraplist.add(cw1);
}

public void addrow()
{
for(integer i=0;i < noofrows;i++)
{
conwraplist.add(new contactwrapper(theaccountid,rownumber++));
}
}

public class contactwrapper
{
public contact con1{set;get;}
public integer rownumber{set;get;}
//srting id{get;set;}
public contactwrapper(string accid,integer rn)
{
con1 = new contact(accountid = accid);
this.rownumber = rn;
} 

}


public pagereference save()
{
list <contact> conlist = new list<contact>();
for(contactwrapper cwf: conwraplist)
{
system.debug('cwf.cont.accountid is' +cwf.con1.lastname);
conlist.add(cwf.con1);
}
insert conlist;
return new pagereference('/'+theaccountid);
}

public pagereference cancel()
{
system.debug('pagereference acid' +theaccountid);
return new pagereference('/'+theaccountid);
}

public void delrow()
{
for (integer i =0;i < conwraplist.size();i++)
{
if(conwraplist[i].rownumber == deleterownumber)
{
conwraplist.remove(i);
}
}

}


}