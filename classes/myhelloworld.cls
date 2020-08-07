public class myhelloworld{
public static void addhelloworld(list <account> acclist)
{
for (account a: acclist)
{
if (a.hello__c != 'world')
{
a.hello__c = 'world';
}
}
}
}