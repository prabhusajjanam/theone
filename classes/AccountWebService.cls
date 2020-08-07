@RestResource(urlMapping='/AccountService/*')
global with sharing class AccountWebService {
    
    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone,Industry, Website FROM Account WHERE Id = :accountId];
        return result;
    }
    
    @HttpPost
    global static string createAccount(String accName) {
        
        account acc = new account(name = accName);
            insert acc;
        return acc.id;
    }

}