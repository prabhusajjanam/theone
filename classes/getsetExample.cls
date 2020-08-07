public class getsetExample
{ 
    public String userinput = 'Dk' ;
    
    public getsetExample()
    {
        system.debug('coming inside constructor');
    }
    
    public String getuserinput(){
        system.debug('coming inside getter');
        return userinput;
        
    }
    
    public pagereference some()
    {
        system.debug('coming inside some');
        return null;
    }
    
    public void setuserinput(String userinput)
    {
        system.debug('coming inside setter');
        this.userinput = userinput;
    } 
    
}