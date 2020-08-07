/**
 * @File Name          : acccreation.cls
 * @Description        : 
 * @Author             : Prabhu Sajjanam
 * @Group              : 
 * @Last Modified By   : Prabhu Sajjanam
 * @Last Modified On   : 07-31-2020
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      		      Modification
 *==============================================================================
 * 1.0    3/31/2019, 10:06:04 PM   Prabhu Sajjanam     Initial Version
**/
//newcommit
//second commit from seventwo project
//added changes 1
//somemore changes
//lunch changes added after lunch
//check if this line is there after pull request
//es commit 1
public class acccreation{

public void accmethod(list<account> acclist) 
{
list<contact> conlist = new list<contact>();
for (Account a:acclist)
{
for (integer i = 0;i<4;i++)
{
contact c = new contact();
c.lastname = 'Santosh'+i;
c.accountid = a.id;
conlist.add(c);
}
}
insert conlist;  
}
}