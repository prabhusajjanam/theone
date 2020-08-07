trigger Example3 on Account (after insert) {
//whenever you create an account with Type Prospect the the rating foeld should automatically updated to cold.
  list<ACCOUNT> accList= New list<ACCOUNT>(); 
    for(account acc: trigger.New){
        if(acc.Type == 'prospect')
            //acc.Rating = 'cold';
            accList.Add(acc);
        }
    list<contact> conlist= new list<contact>();
    system.debug('Debug accList.size() is : expected value should be 50 but actual is: '+accList.size());
    //for(ID con : accList)
        FOR(integer i=0;i<accList.size();i++) {
            contact newContact = new contact(LastName = accList[i].name, accountid = accList[i].id);
            conlist.add(newContact);
        }
        system.debug('Debug conlist.size() is : expected value should be 50 but actual is: '+accList.size());
    
    insert conlist;
}

//create contact with same name as account
//need to get IDS related to account
//type should set to prospect
//