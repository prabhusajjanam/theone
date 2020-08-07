//Class for autopopulating the related object fields
public with sharing class ExtensionController{
 public ApexPages.StandardController standardCon;
 
 public ExtensionController(ApexPages.StandardController con){
 standardCon = con;
 }
 
 public void populateRelAccFields(){
 Opportunity opp = (Opportunity) standardCon.getRecord();
 opp.Account = [select Phone, Type from Account where id =: opp.AccountId];
 }
}