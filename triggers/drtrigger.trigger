trigger drtrigger on Lead (before insert,before update) {
list<lead> llist = trigger.new;
for (lead l: llist)
{
l.firstname = 'Dr'+l.firstname;
}
}