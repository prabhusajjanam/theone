public class dyanamicVariable
{
 list<Account> acts;

public list<Account> getacts()
{
return acts;
}
public PageReference channel()
{
acts=[select Name,type,Industry,Phone,Fax from Account where type='Customer - Channel'];
return null;
}
public PageReference direct()
{
acts=[select Name,type,Industry,Phone,Fax from Account where type='Customer - Direct'];
return null;
}



}