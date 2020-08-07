@istest
public class testscenario2{
public static testmethod void mytest()
{
string adderror;
account a1 = new account(name = 'pqr1');
insert a1;
account a2 = new account(name = 'pqr1');
insert a2;
system.assertequals('you cannot create duplicate account baby',adderror);
try
{
insert a2;
}
catch (exception e)
{
system.debug('if you are seeing this then the trigger is working');
}
}
}