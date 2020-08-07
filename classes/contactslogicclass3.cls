public with sharing class contactslogicclass3{
    public list<contactwrapper> conwraplist{set;get;}
    public boolean renderflag{get;set;} 
    public apexpages.standardcontroller standardcon;
    private integer rownumber =0;
    public integer noofrows{set;get;}
    public string theaccountid{get;set;}
    public integer deleterownumber{get;set;}
    public contact con1{get;set;}
    public string abc{get;set;}
    string accid{get;set;}
    
    public contactslogicclass3(apexpages.standardcontroller con)
    {
        abc = 'abc value is 123';
        standardcon = con;
        
        /*con1 = (contact)con.getrecord();
renderflag = false;

contact con2 = (contact) con.getrecord();
string theaccountid2 = con2.accountid;
system.debug('contact account id in constructor is '+theaccountid2);*/
    }
    
    public void contactslogic()
    {
        renderflag = true;
        //accid=Apexpages.currentpage.getparameters.get('accid');
        //accid=Apexpages.currentpage().getParameters().get('accId');
        contact con1 = (contact) standardcon.getrecord();
        system.debug('contact account id is '+con1.accountid);
        theaccountid = con1.accountid;
        system.debug('renderflag is' +renderflag);
        //contact con1=new contact(accountid=accid);
        conwraplist = new list<contactwrapper>();
        contactwrapper cw1 = new contactwrapper(theaccountid,rownumber++);
        conwraplist.add(cw1);
        
        system.debug ('theaccountid is bla bla bla '+theaccountid);
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
        //
        public contactwrapper()
        {
            system.debug('constructor invoked');
        }
        public contactwrapper(string myaccountid,integer rn)
        {
            system.debug('second constructor is invoked');
            con1 = new contact(accountid = myaccountid,firstname = 'fn');
            this.rownumber = rn;
        } 
        
    }
    
    
    public pagereference save()
    {
        list <contact> conlist = new list<contact>();
        for(contactwrapper cwf: conwraplist)
        {
            //contact cbaby = new contact();
            system.debug('cwf.cont.accountid is' +cwf.con1);
            //cbaby = cwf.con1;
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