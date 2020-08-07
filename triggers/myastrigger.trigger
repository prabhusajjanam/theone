trigger myastrigger on contact (after insert) {
myas2.myasmethod(trigger.new);
}