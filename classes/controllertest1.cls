@istest 
public class controllertest1{
@istest
public static void mytestmethod()
{
program__c myp = new program__c();
myp.name = 'csharp';
myp.Pass_Perentage__c = 80;
myp.Program_Cost__c = 300;
insert myp;
date mydate = date.newinstance(2015,12,28);
batch__C mybatch1 = new batch__c();
mybatch1.name = 'testclass';
mybatch1.faculty_name__C = 'testfaculty';
mybatch1.date_of_starting__c = mydate;
program__c p = [select id from program__c where name = 'csharp'];
mybatch1.programs__C = p.id;
simplebatch2 sb = new simplebatch2();
sb.mybatch = mybatch1;
sb.save();
}
}