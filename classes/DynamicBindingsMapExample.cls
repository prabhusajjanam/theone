public class DynamicBindingsMapExample 
{
    public Map<string, list<account>> accountsMap {get; set;}
    public List<selectoption> keys {get; set;}
    public String selectedKey {get; set;}
    public Map<string, account> accsByName {get; set;}
     
    public Set<string> getMapKeys()
    {
        return accountsMap.keySet();
    }
     
    public DynamicBindingsMapExample()
    {
        accsByName=new Map<string, account>();
        List<string> sortedKeys=new List<string>();
        accountsMap=new Map<string, list<account>>();
        accountsMap.put('All', new List<account>());
        List<account> accs=[select id, Name, BillingStreet, BillingCity, BillingPostalCode 
                            from Account order by Name asc];  
        for (Account acc : accs)
        {   
            SYSTEM.debug('STARTING ACCOUNTSMAP IS' +accountsMap);
            accountsMap.get('All').add(acc);
            String start=acc.Name.substring(0,1);
            List<account> accsFromMap=accountsMap.get(start);
            if (null==accsFromMap)
            {   SYSTEM.debug('INSIDE NULL LOOP AND ACCOUNTSMAP IS' +accountsMap);
                accsFromMap=new List<account>();
                accountsMap.put(start, accsFromMap);
            }
            SYSTEM.debug('OUTSIDE NULL LOOP AND ACCOUNTSMAP IS' +accountsMap);
            accsFromMap.add(acc);
            accsByName.put(acc.name, acc);
        }
         
        keys=new List<selectoption>();
        for (String key : accountsMap.keySet())
        {
            if (key != 'All')
            {
                sortedKeys.add(key);
            }
        }
        sortedKeys.sort();
        sortedKeys.add(0,'All');
         
        for (String key : sortedKeys)
        {
            keys.add(new SelectOption(key, key));
        }
         
        selectedKey='All';
    }
}