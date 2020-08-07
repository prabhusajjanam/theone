trigger acphonetrig on Account (after update) {
if (recursion.handler = false)
{
acphone.acmethod(trigger.new);
}
}