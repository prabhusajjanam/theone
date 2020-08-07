@RestResource(urlmapping='/v1/accounts7/*')
global with sharing class restresource_service_v1{


@httpget
global static account gettingaccount()
{
restrequest req = restcontext.request;
restresponse res = restcontext.response;

string accountid = req.requesturi.substring(req.requesturi.lastindexof('/')+1);
account resultaccount = [select id,name,phone,website,billingstate from account where id = :accountid];
return resultaccount;


}

}