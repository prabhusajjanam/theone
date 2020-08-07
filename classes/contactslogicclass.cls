public with sharing class contactslogicclass{
public list<contact> conlist {get;set;}
public boolean renderflag {get;set;} 
public apexpages.standardcontroller standardcon;
public integer rownumber {get;set;}
public integer noofrows {get;set;}
public id theaccountid;

public contactslogicclass(apexpages.standardcontroller con)
{
renderflag = false;
standardcon = con;
}

public void contactslogic()
{
rownumber = 1;
renderflag = true;
system.debug('renderflag is' +renderflag);
contact con1 = (contact) standardcon.getrecord();
system.debug('contact account id is '+con1.accountid);
theaccountid = con1.accountid;
conlist = new list<contact>();
contact c1 = new contact(accountid = theaccountid);
conlist.add(c1);

}

public void addrow()
{
for(integer i=0;i < noofrows;i++)
{
rownumber = rownumber+1;
contact c2 = new contact(accountid = theaccountid);
conlist.add(c2);
}
}


}