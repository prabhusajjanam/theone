trigger VV_CaseTrigger on Case (before insert, before update, before delete, after insert, after update, after delete, after undelete) 
{
    return;
    VV_TriggerDispatcher.Run(new VV_CaseTriggerHandler());
}