trigger assingtrig1 on Account (after insert) {
account acc = trigger.new[0];
contact c = new contact();
c.lastname = acc.name;
if (recursion.handler == false)
{
recursion.handler = true;
insert c;
}
}