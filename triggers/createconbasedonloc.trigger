trigger createconbasedonloc on Account (after insert) {
numberoflocations.createcontacts(trigger.new);
}