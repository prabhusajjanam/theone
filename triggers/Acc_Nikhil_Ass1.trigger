trigger Acc_Nikhil_Ass1 on Account (before insert) {
for(Account A :trigger.new)      // loading list of accounts  
{
    if(A.site != 'Newyork') // if the dite is not newyork 
    {
        if(string.isNotBlank(A.site))
        {
        A.adderror('Account site should be Newyork Only');// then throwing error that it must be newyork
        A.site.adderror('Account site should be Newyork Only');
        }
        
    }
    
}
}