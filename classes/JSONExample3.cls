public class JSONExample3 {
    public String result1 {set;get;}
    public String result12 {set;get;}
    public String result3 {set;get;}
    public JSONExample3(){
        Account a1=new Account(Name='TCS',Phone='123');
        result1=JSON.serialize(a1);
        Map<String,Object> result12 = (Map<String,Object>) JSON.deserializeUntyped(result1);
        Decimal amt=1000;
        result3=JSON.serialize(amt);
    }
}