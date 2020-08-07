public class amountgreateropp{
public static void trigger_method(list<opportunity> ops)
{
double total_amount = 0;
for (opportunity o1 : [select amount from opportunity where createddate = today and createdbyid = :userinfo.getuserid()])
{
 total_amount = total_amount + o1.amount;
}
for (opportunity o2: ops)
{
    total_amount = total_amount + o2.amount;
    if (total_amount > 100000)
  o2.addError('total amount cannot exceed more than 100000 perday');
}
}
}