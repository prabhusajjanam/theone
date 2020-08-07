trigger annualexample on Account (before insert) {
            List<Account> accs = Trigger.New;
            for(Account a:accs){
                if(a.industry=='Banking')
                    a.annualRevenue=5000000;
            }

    }