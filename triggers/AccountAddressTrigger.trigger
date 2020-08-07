trigger AccountAddressTrigger on Account (before insert,before update) {
    
   
        for(account a: trigger.new)
        {
            if(a.Match_Billing_Address__c)
            {
                a.ShippingPostalCode = a.BillingPostalCode;
            }
        }
}