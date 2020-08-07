public class apexradio{
string country = null;


public pagereference test()
{
return null;
}

public list<selectoption> getitems()
{
list<selectoption> options = new list<selectoption>();
options.add(new selectoption ('US','us'));
options.add(new selectoption ('UK','uk'));
options.add(new selectoption ('INDIA','india'));
options.add(new selectoption ('AUSTRALITA','australia'));
options.add(new selectoption ('NEWZEALAND','newzealand'));
return options;
}

public string getcountry()
{
return country;
}

public void setcountry(string c)
{
this.country = c;
}

}