public class FilterWrap {
    public List<SelectOption> fields    {set;get;}
    public List<SelectOption> operators {set;get;}
    public String  value                {set;get;}
    public String fldselected           {set;get;}
    public String optSelected           {set;get;}
    public FilterWrap(List<String> fldList){
        fields=new List<SelectOption>();
        operators=new List<SelectOption>();
        SelectOption n=new SelectOption('none','-None-');
        fields.add(n);
        operators.add(n);
        for(String s:fldList){
            selectOption op=new SelectOption(s,s);
            fields.add(op);
        }
        List<string> optList=new List<String>{'=','!=','<','>'};
        for(String s1:optList){
          selectOption op1=new SelectOption(s1,s1);
            Operators.add(op1);
        }
    }

}