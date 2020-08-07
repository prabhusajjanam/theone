public class DynamicExample {
    public Map<String,Schema.SobjectType> objMap;
    public Map<String,Schema.SobjectField> fldMap;
    public List<SelectOption> objects           {set;get;}
    public List<SelectOption> selectedOpt       {set;get;}
    public List<SelectOption> notSelectedOpt    {set;get;}
    public Set<String> selectedFields           {set;get;}
    public Set<String> notSelectedFields        {set;get;}
    public String selectedObject                {set;get;}
    public List<string> addFields               {set;get;}
    public List<String> removeFields            {set;get;}
    public List<String> fieldNames              {set;get;}
    public List<FilterWrap> filters             {set;get;}
    public String query                         {set;get;}
    public List<String> fldList                 {set;get;}
    public List<Sobject> result                 {set;get;}
    public DynamicExample(){
       
        objects=new List<SelectOption>();
        selectedOpt=new List<selectOption>();
        notSelectedOpt=new List<SelectOption>();
        selectedFields=new set<String>();
        notSelectedFields=new Set<String>();
        addFields=new List<String>();
        removeFields=new List<String>();
        objMap=Schema.getGlobalDescribe();
        List<String> objNames=new List<String>(objMap.keySet());
        objNames.sort();
        SelectOption n=new SelectOption('none','-None-');
        objects.add(n);
        selectedOpt.add(n);
        notSelectedOpt.add(n);
        for(String s:objNames){
            Schema.DescribeSobjectResult result=objMap.get(s).getDescribe();
            if(result.isCustom()){
                SelectOption op=new SelectOption(s,s);
                objects.add(op);
            }
        }
    }
    public void getFields(){
        Schema.SobjectType sobj=objMap.get(selectedObject);
        Schema.DescribeSobjectResult result=sobj.getDescribe();
        fldMap=result.fields.getMap();
        fieldNames=new List<String>(fldMap.keyset());
        fieldNames.sort();
        notSelectedFields.addAll(fieldNames);
        getData();
    }
    public void getData(){
        selectedOpt.clear();
        notselectedOpt.clear();
         SelectOption n=new SelectOption('none','-None-');
        if(selectedFields.size()>0){
            for(String s1:selectedFields){
                SelectOption op1=new SelectOption(s1,s1);
                selectedOpt.add(op1);
            }
        }else{
           selectedOpt.add(n); 
        }
        if(notselectedFields.size()>0){
            for(String s2:notselectedFields){
                SelectOption op2=new SelectOption(s2,s2);
                notselectedOpt.add(op2);
            }
        }else{
           notselectedOpt.add(n); 
        }
    }
    public void addOptions(){
        notSelectedFields.removeAll(addFields);
        selectedFields.addAll(addFields);
        getData();
    }
    public void removeOptions(){
        selectedFields.removeAll(removeFields);
        notSelectedFields.addAll(removeFields);
        getData();
    }
    public void addFilter(){
        FilterWrap fw=new FilterWrap(fieldNames);
        filters.add(fw);
    }
    public void createFilter(){
         filters=new List<FilterWrap>();
        addFilter();
    }
    public void formQuery(){
        query='select id ';
        fldList=new List<String>(selectedFields);
        for(String s:fldList){
            query=query+','+s;
            system.debug('Query is ' +query);
        }
        query=query+' from '+selectedObject;
        system.debug('Query is ' +query);
        system.debug('testing this');
        system.debug('filters.size() is ' +filters.size());
        if(filters.size()>0){
            system.debug('Query is ' +query);
            system.debug('filters[0].fldselected ' +filters[0].fldselected);
            system.debug('filters[0].optSelected ' +filters[0].optSelected);
            system.debug('+filters[0].value ' +filters[0].value);
            query=query+' where '+filters[0].fldselected+''+filters[0].optSelected+' 			\''+filters[0].value+'\'';
        }
        system.debug('Query is ' +query);
        result=Database.query(query);    
    }
}