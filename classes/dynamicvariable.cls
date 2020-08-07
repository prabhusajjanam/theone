public class dynamicvariable
{
list<account> acts;
     public list<account> getacts()
     {
      return acts;
     }
     public pagereference channel()
     {
        acts=[select Name,Type,Industry,phone,fax from account where type='customer-channel'];
        return null;
        }
        public pagereference direct()
       {
       
       acts=[select Name,Type,Industry,phone,fax from account where type='customer-direct'];
       return null;
       }
       }