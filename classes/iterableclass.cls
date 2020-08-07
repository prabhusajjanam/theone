global class iterableclass implements iterable<Account>{
   global Iterator<Account> Iterator(){
      return new customaccountiterator();
   }
}