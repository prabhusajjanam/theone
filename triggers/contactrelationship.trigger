trigger contactrelationship on Contact (after insert) {

contactrelationship.mycontactrelationship(trigger.new);
}