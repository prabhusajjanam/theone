trigger staketrigger on Stakeholder__c (before insert,before update) {

list<id> contidlist = new list<id>();
map<id,string> mymap = new map<id,string>();
for (stakeholder__C st: trigger.new)
{
if (st.contact__c != null)
{
contidlist.add(st.contact__c);
}
}
list <contact> conlist = [select id,nps_id__r.name from contact where id in :contidlist];
for (contact c:conlist)
{
mymap.put(c.id,c.nps_id__r.name);
}
for (stakeholder__c st2:trigger.new)
{
if (st2.contact__c != null)
{
st2.nps_id_1__c = mymap.get(st2.contact__c);
}
else
{
st2.nps_id_1__c = null;
}
}
}