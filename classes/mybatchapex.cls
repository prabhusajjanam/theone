global class mybatchapex implements database.batchable<sobject>{
string query;
string entity;
string field;
string value;

global mybatchapex(string q,string e,string f,string v)
{
query = q;
entity = e;
field = f;
value = v;
}

global database.querylocator start(database.batchablecontext mydbc)
{
return database.getquerylocator(query);
}
global void execute(database.batchablecontext mydbc,list<sobject> scope)
{
for (sobject so: scope)
{
so.put(field,value);
update scope;
}
}
global void finish(database.batchablecontext mydbc)
{
//do nothing
}
}

/*

below is used to execute - but we need to give constructor

string q = 'select name,description from account limit 5';
string e = 'account';
string f = 'description';
string v = 'mybatchapex desciption';

id mybatchapexid = database.executebatch(new mybatchapex (q,e,f,v));





*/