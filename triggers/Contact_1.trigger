trigger Contact_1 on Contact (Before Insert) {
 for (Contact c : Trigger.new){
 if (c.email == NULL)
 c.addError ('Please give the email');
 }

}