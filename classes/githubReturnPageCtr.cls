public class githubReturnPageCtr {
    public string returnCode{get;set;}
    public string response{get;set;}
    public string actualResponse{get;set;}
    
    public void getcode()
    {
        system.debug('consturctor invoked');
        string rcode = apexpages.currentPage().getParameters().get('code');
        returnCode = rcode;
        system.debug('rcode is '+rcode);
        
        http http = new http();
        httprequest req = new httprequest();
        
        req.setEndpoint('https://github.com/login/oauth/access_token');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody('code='+rcode+'&client_id=15a4f5de0e50a1cd85c1&client_secret=78f839ace2d0418a12d623cf28b50e920fa278ab');
        
        httpresponse res = http.send(req);
        
        response = res.getBody();
        
        accessTokenResponse atr = (accessTokenResponse)JSON.deserialize(response, accessTokenResponse.class);
        
        getCommits(atr.access_token);
        
        
        
    }
    
    public void getCommits(string accessToken)
    {
        
        http http = new http();
        httprequest req = new httprequest();
        
        req.setEndpoint('https://api.github.com/repos/prabhusajjanam/esfour/issues/1');
        req.setMethod('GET');
        req.setHeader('Content-Type','application/json');
        req.setHeader('Authorization','token '+accessToken);
        
        httpresponse res = http.send(req);
        
        actualResponse = res.getBody();
        system.debug('atr is '+actualResponse);
        
        
        githubWrapper ghw = (githubWrapper)JSON.deserialize(actualResponse, githubWrapper.class);
        
        
        system.debug('title is '+ghw.title);
        
        
    }
    
    public class accessTokenResponse{
        public String token_type{get;set;}
        public String scope{get;set;}
        public String access_token{get;set;}
    }
    
   
}