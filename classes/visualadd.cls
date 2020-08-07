public class visualadd{
integer x;
integer y;
integer z;
integer field1;
integer field2;
integer field3;
public void setfield1(integer i)
{
x = i;
field1 = i;
}
public integer getfield1()
{
return field1;
}
public void setfield2(integer j)
{
field2 = j;
y = j;
}
public integer getfield2()
{
return field2;
}
public void myadd()
{
z = x + y;
}
public integer getfield3()
{
field3 = z;
return field3;
}
integer m = 0;
integer field4;
public void setfield4(integer h)
{
if (h == 0)
{
m = 1;
}
else
{
m = h+1;
}
}
public integer getfield4()
{
if (m != 0 )
{
field4 = m;
return field4;
}
else
{
m = m+1;
field4 = 0;
return field4;
}
}
}