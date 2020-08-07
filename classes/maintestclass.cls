@istest(seealldata = true)
private class maintestclass{
    @istest static void testaccountcreation()
    {
        list<account> acclist = new list<account>();
        for (integer i=0;i<4;i++)
        {
            account acc = new account();
            acc.name = 'Shiva'+i;
            acc.Type = 'Prospect';
            acclist.add(acc);
        }
        
        //inserting user 
        
        profile p1 = [select id from profile where name = 'System Administrator'];
        user u = new user();
        u.profileid = p1.id;
        //u.userroleid = someroleid;
        u.lastname = 'prashisa123@gmail.com';
        u.alias = 'pgroup';
        u.username = 'prashisa123@gmail.com';
        u.Email='bruce.wayne@wayneenterprises.com';
        u.EmailEncodingKey='UTF-8';
        u.Firstname='Bruce';
        u.Lastname='Wayne';
        u.LanguageLocaleKey='en_US';
        u.LocaleSidKey='en_US';
        u.TimeZoneSidKey='America/Chicago';
        insert u;
        system.runas(u)
        {
            insert acclist;
        }
        //acccreation.accmethod(acclist);
    }
}