trigger mytrig on Account (after update)
{
Acctocont.m1(trigger.new);
//getphone myphone = new getphone();
//myphone.m2(trigger.new);
}