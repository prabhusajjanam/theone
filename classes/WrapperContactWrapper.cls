Public class WrapperContactWrapper

{
    Public Contact con{get;set;}
    Public boolean bool{get;set;}
    public WrapperContactWrapper(Contact c,boolean bool)
        
    {
        this.con = c;
        this.bool = bool;
    }
}