public class mysearchclass{
  string keyword;
  list<account> acts;
  public void setkeyword(string s)
  {
  keyword = s;
  }
  public string getkeyword()
  {
  return keyword;
  }
  public pagereference mysearch()
  {
  acts = (list<account>)[find :keyword in all fields returning account(name,id,phone,industry)][0];
  return null;
  }
  public list<account> getacts()
  {
  return acts;
  }


}