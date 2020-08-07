trigger designation on TOP_X_DESIGNATION__c (after insert,before update,before delete) {


list <opportunity> opplist = new list<opportunity>();
set<id> oppid = new set<id>();
set<id> oppdelid = new set<id>();
map<id,id> mapdocattachtrue = new map<id,id>();
map<id,id> mapdocattachfalse = new map<id,id>();
map<id,id> mapdelete = new map<id,id>();




If (trigger.isinsert || trigger.isupdate)
{
for (TOP_X_DESIGNATION__c topdes: trigger.new)
{
If(topdes.item_type__c == 'design1' && topdes.document_attached__c == true)
{
mapdocattachtrue.put(topdes.opportunity__c,topdes.id);
oppid.add(topdes.Opportunity__c);
}
Else
{
mapdocattachtrue.put(topdes.opportunity__c,topdes.id);
oppid.add(topdes.opportunity__c);
}
}
}

If(trigger.isdelete)
{
for (top_x_designation__c topdes2: trigger.old)
{
mapdelete.put(topdes2.opportunity__c,topdes2.id);
oppdelid.add(topdes2.opportunity__c);
oppid.add(topdes2.opportunity__c);
}

}
list<opportunity> myopp = [select id,handsoff_attached__c from opportunity where id in :oppid];
if(myopp.size() > 0 && myopp != null)
{
for (opportunity o: myopp)
{
if (mapdocattachtrue.containskey(o.id))
{
o.handsoff_attached__c = 'Yes';
}
if (mapdocattachfalse.containskey(o.id))
{
o.handsoff_attached__c = 'No';
}
if (oppdelid.contains(o.id))
{
o.handsoff_attached__c = '';
}
opplist.add(o);
}

}

if (opplist.size() > 0 && opplist != null)
{
update opplist;
}




}