trigger dupacc on Account (before insert) {

for (account a: trigger.new)  //list of accounts

{
list<account> acc = [select name from account where name = :a.name ]; // fetching a account name and storing in variable acc
if (acc.size() > 0)
for (account a2: trigger.new)  // checking for the duplicatename in the record and throwing error
{
{
a2.name.adderror('you cannot add duplicate account');
}
}
}
}