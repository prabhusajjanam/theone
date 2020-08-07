@isTest
public class Example3_Test{
	@isTest
    public static void testMethod1()
    {
        //Mimic the ui testing in the form of apex automation.
        list<account> acclist = new list<account>();
        for(integer i = 0; i < 50 ;i++)
        {
        account acc = new account();
        acc.name = 'FirstAccount'+i;
        acc.Type = 'Prospect';
        acclist.add(acc);
        }
        insert acclist;
        //done with testing (ui)
        //verify
        list<contact> contlist = [select id,lastname from contact where accountid in :acclist ];
        if(contlist != null && !contlist.isEmpty() )
        system.assertEquals(50,contlist.size());
    }
}