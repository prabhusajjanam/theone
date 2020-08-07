trigger myfinaltrig on Contact (after update) {
myfinalas1.mymethod(trigger.new);
}