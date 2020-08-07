public class AllObjectsinOrg {
 Public string ObjectSelected{get;set;}
 Public string fldselected{get;set;}
 Public Map<String, Schema.SObjectType> AllObjmap;
 Public Map <String, Schema.SObjectField> fieldMap;
 Public boolean rendflag{get;set;}
 Public AllObjectsinOrg(){
    AllObjmap = New Map<String, Schema.SObjectType>();
    AllObjmap = Schema.getGlobalDescribe();
    System.debug('******All object Names :'+ AllObjmap.keyset());
}
Public List<selectoption> getObjList(){
    List<selectoption> objList = new List<selectoption>();
    for(string s:AllObjmap.keyset()){
        objList.add(new selectoption(s,s));
    }
  return objList;   
 }
 Public List<selectoption> getFieldList(){
    List<selectoption> fldList = new List<selectoption>();
    if(!fieldMap.isEmpty()){
      for(string s:fieldMap.keyset()){
          fldList.add(new selectoption(s,s));
      }
      if(fldList.size()== 0)
         fldList.add(new selectoption('--None--','--None--'));
    }  
  return fldList;   
 }
  Public void fieldsofObject(){
    fieldMap = New Map <String, Schema.SObjectField>(); 
    fieldMap = AllObjmap.get(objectSelected).getDescribe().fields.getMap();
    System.debug('###### all fields of object## :' + fieldMap.keyset());
    rendflag = true;
 }
}