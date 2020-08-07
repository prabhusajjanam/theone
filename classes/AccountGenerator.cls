global class AccountGenerator implements Iterator<Account> {
       List<Account> accs {get; set;}
       Integer i {get; set;} 
  public AccountGenerator(Integer GeneratorLimit) {
    accs = [Select id,site from account where name like '%create%'];
    i=0;
  }
  global boolean hasNext() {
    if( i >= accs.size())
    {
        return false;
    }
    else
    {
        return true;
    }
  }
  global Account next() {
    if (i >= accs.size())
    {
        return null;
    }
    i++;
    return accs[i-1];
  }
}