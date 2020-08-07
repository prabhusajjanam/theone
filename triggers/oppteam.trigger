trigger oppteam on Opportunity (after insert) {
list <opportunityshare> sharestocreate = new list<opportunityshare>();
list<opportunityteammember> oppteam = new list <opportunityteammember>();
/*
opportunityshare oshare = new opportunityshare();
oshare.opportunityaccesslevel = '';
oshare.opportunityid = trigger.new[0].id;
oshare.userorgroupid=trigger.new[0].createdbyid;
sharestocreate.add(oshare);

opportunityteammember ot = new opportunityteammember();
ot.opportunityid = trigger.new[0].id;
ot.userid=trigger.new[0].ownerid;
ot.teammemberrole='Account Manager';
oppteam.add(ot);

if(oppteam != null && oppteam.size() > 0)
{
insert oppteam;
}

if(sharestocreate != null && sharetocreate.size() > 0)
{
list<database.saveresult> sr = database.insert(sharestocreate,false);
}
*/
}