public class dummyClassCheck {
    
    
    public static void methodOne()
    {
        map<string,string> firstMap = new map<string,string>();
        methodTwo(firstMap);
        system.debug('firstMap is '+firstMap);
    }
    
    public static void methodTwo(Map<string,string> inputMap)
    {
        inputMap.put('one','two');
    }

}