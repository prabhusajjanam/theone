public with sharing class provethat1 {

    public provethat1(ApexPages.StandardController controller) {
  mywrapperlist = new list<mywrapper>();
  mywrapper mw = new mywrapper();
  mywrapperlist.add(mw);
    }



public list<mywrapper> mywrapperlist{set;get;}
//string accid = '0012800000Dr3tBAAR';


public pagereference save()
{
list <contact> conlist = new list<contact>();
for (mywrapper mw2: mywrapperlist)
{
contact c = new contact();
c = mw2.con;
conlist.add(c);
}
insert conlist;
return null;
}


public class mywrapper{
public contact con{get;set;}
public mywrapper()
{
con = new contact();
}
}

}