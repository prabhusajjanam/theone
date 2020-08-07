public class MyClassMy{
    //test comment
    public static void enterNumber(Decimal someNum){
        integer for3 = (someNum/3).intValue();
        integer for5 =(someNum/5).intValue(); 
        Map<integer,string> map3num = new Map<integer,string>();
        Map<integer,string> map5num = new Map<integer,string>();
        
        for(integer i=0; i<=for3; i++){
            map3num.put((i*3),'Happy');
        }
        
        for(integer i=0; i<=for5; i++){
            map5num.put((i*5),'Fizz');
        }
        
        for(integer i=0;i<=someNum;i++){
            if (map3num.containsKey(i) && map5num.containsKey(i)){
                system.debug(i+'  '+map3num.get(i) +' '+map5num.get(i));
            }else if(map3num.containsKey(i)){
                system.debug(i+'  '+map3num.get(i));
            }else if(map5num.containsKey(i)){
                system.debug(i+'  '+map5num.get(i));
            }else {
                system.debug(i);
            }   
        }
    }
}