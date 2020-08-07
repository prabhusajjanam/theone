public class myfutureclass{
@future
public static void myfuturemethod(set<id> myid){
list<account> acts = [select name,type,industry,phone,fax from account where id = :myid];
for (account acc: acts)
{
acc.phone = '7845024447';
}
update acts;
}
}