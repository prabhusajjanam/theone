public class dummyClassCheck {
    
    //This is my new line which I want to include as per new requirement
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