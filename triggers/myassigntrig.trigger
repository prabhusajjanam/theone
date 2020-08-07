trigger myassigntrig on Contact (before insert) {
contact con = trigger.new[0];
account a = new account();
a.name = con.lastname;
insert a;
}