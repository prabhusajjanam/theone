trigger mysuperastrig1 on Contact (after update) {
mysuperas1.contmethod(trigger.new);
}