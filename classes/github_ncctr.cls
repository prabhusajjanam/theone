public class github_ncctr {
    
    public string response{get;set;}
    
    
    public void getIssues()
    {
        http http = new http();
        httprequest req = new httprequest();
        req.setEndpoint('callout:githubIssues');
        req.setMethod('GET');
        
        httpresponse res = http.send(req);
        
        response = res.getBody();
        
        
    }

}