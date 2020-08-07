trigger example9 on Account (before insert) {
    for(Account a: Trigger.New){
        if(a.industry=='Banking'){
            a.AnnualRevenue=100000;
    }else{
        if(a.industry == 'Energy'){
                    a.AnnualRevenue=50000;
          }          
        }
    }
}