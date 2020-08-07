trigger myassign4 on Opportunity (after insert,after update,before delete) {
if (trigger.isinsert || trigger.isupdate)
{
assign4.myassign2method(trigger.new);
}
if (trigger.isdelete)
{
assign4.myassign2method(trigger.old);
}
}