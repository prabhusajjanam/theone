trigger trainingExample1 on Account (before Insert) {

for(account acc: trigger.New)
{
 if (acc.phone != null)
 {
   acc.fax = acc.phone; 
 }

}


}