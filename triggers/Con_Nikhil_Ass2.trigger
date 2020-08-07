trigger Con_Nikhil_Ass2 on Contact (before insert,before update) {
nikhil_ass2.mymethod(trigger.new,trigger.oldmap);
}