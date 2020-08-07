trigger knowIt on Account (before insert) {
  public static integer i = 0;
  list<account> acclist = trigger.new;
  system.debug('trigger.new size is ' + acclist.size());
  for(account acc: trigger.new)
  {
   i++;
  }
  system.debug('i value is ' +i);

}