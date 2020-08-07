@istest
public class testhello{
@istest
public static void mytestmethod()
{
account acc = new account();
acc.name = 'Nelson';
acc.type = 'Prospect';
acc.hello__C = 'world';
insert acc;
account acc2 = [select hello__C from account where name = :acc.name];
system.assertequals('world',acc2.hello__c);
}
}