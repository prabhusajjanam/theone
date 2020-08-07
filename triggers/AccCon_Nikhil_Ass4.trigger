trigger AccCon_Nikhil_Ass4 on account (after insert) {
    list<contact> conlist = new list<contact>();
 for(account a:trigger.new)
 {
     for(integer i=0;i<4;i++)
     {
         contact c = new contact();
         c.AccountId= a.id;
         c.lastname= a.name+i;
         c.MobilePhone= '1234';
         conlist.add(c);
         
         
     }
 }
    insert conlist;

}