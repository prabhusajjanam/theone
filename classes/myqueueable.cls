public class myqueueable implements queueable
{
public void execute(queueablecontext myqc)
{
account a = new account(name = 'queueableaccount');
insert a;
}
}
//id myjobid = system.enqueuejob(new myqueueable()); --> this is used to execute the above queueable class in dev console