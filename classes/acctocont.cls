public class acctocont
 {
 public static void m1(list<account> acclist)
 {
 list <contact> conlist = new list <contact>();
 
 for (account acc:acclist)
 {
 for (integer i=0;i<4;i++)
{
 contact con=new contact();
 con.lastname='prabhu'+i;
 con.accountid=acc.id;
 conlist.add(con);
 //insert con;
 }
 }
 insert conlist;
 }
 }