trigger amounttrig on Opportunity (before insert,before update) {
amountgreateropp.trigger_method(trigger.new);
}