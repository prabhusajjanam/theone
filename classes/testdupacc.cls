@istest
public class testdupacc
{

@istest
public static void mytestmethod()
{

account a1 = new account();
a1.name = 'abcdz';
a1.type='Prospect';
insert a1;
try
{
account a2 = new account();
a2.name = 'abcdz';
a2.type='Prospect';
insert a2;
}
catch(exception e)
{
system.debug('getmessage is' +e.getmessage());
boolean b1 = e.getmessage().contains('you cannot add duplicate account')?true:false;
system.assertequals(b1,true);
system.debug('If code comes here then your code is working');
}
}
}