public with sharing class wizard{
 Account a = new Account();
 contact c = new contact();
 opportunity o = new opportunity();
public payment__c p1{get;set;}
 public wizard(){
 
 p1=new payment__c();
 }
 //public payment__c getp(){
 //return p;
 
 //}
 public pagereference s(){
 insert p1;
 //system.debug('name'+p.name);
 return new pagereference('/'+p1.id);
 
 }
 
 public account geta()
 {
 return a;
 }
 
 public contact getc()
 {
 return c;
 }
 
 public opportunity geto()
 {
 return o;
 }
 
 public pagereference account_detils()
 {
 return page.account_details;
 }
 
 public pagereference contact_detils()
 {
 return page.contact_details;
 }
 
 public pagereference opportunity_detils()
 {
 return page.opportunity_details;
 }
 
 public pagereference review_page()
 {
 return page.contact_details1;
 }
 
 public pagereference save_all_page()
 {
 insert a;
 c.accountid= a.id;
 insert c;
 o.accountid = a.id;
 insert o;
 return page.thankyou_page;
 }
 public pagereference save(){
 

 insert p1;
 
 return new pagereference('/'+p1.id);
 
 
 }
 
 
 
 
 
 
}