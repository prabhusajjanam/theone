/**
 * @File Name          : AccountManager.cls
 * @Description        : 
 * @Author             : Prabhu Sajjanam
 * @Group              : 
 * @Last Modified By   : Prabhu Sajjanam
 * @Last Modified On   : 4/2/2019, 1:33:00 AM
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    4/2/2019, 12:57:48 AM   Prabhu Sajjanam     Initial Version
**/
@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager{
    @HttpGet
    global static Account getAccount(){
        RestRequest req = RestContext.request;
        String accId = req.requestURI.substringBetween('Accounts/', '/contacts');
        Account acc = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) 
                       FROM Account WHERE Id = :accId];
        
        return acc;
    }
}