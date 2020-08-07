/* this program is to detect the creation of duplicate account and trigger the error message while insert and update*/

trigger triggerscenario2 on Account (before insert,before update) {

for (account a: trigger.new)
{
list <account> acc = [select id from account where name = :a.name and rating = :a.rating];
if (acc.size()>0)
{
a.name.adderror('you cannot create duplicate account baby');
}
}
}