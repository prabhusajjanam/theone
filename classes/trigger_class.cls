public class trigger_class{

        public static void check_opp(List<Opportunity> ops){
        Double total_amount = 0;
        for(Opportunity o1: [select Amount from Opportunity where createdDate=TODAY
                                            AND createdbyID = :userInfo.getuserID()]){
          total_amount += o1.Amount;
        }
        
        for (Opportunity o2: ops){
             total_amount += o2.Amount;
             
             if(total_amount > 100000)
             o2.addError('you have exceeded daily limit');
         }
    }    
}