trigger lexample1 on Account (before insert) {
 for(Account a : Trigger.New){
  if(a.industry == 'Banking' && a.annualrevenue < 10000){
   a.addError('Annual revenue should be greater than 10000');
  }
 } 
}