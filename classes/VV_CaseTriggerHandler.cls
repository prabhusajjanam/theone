public class VV_CaseTriggerHandler implements VV_TriggerHandler_Interface
{
    // Allows unit tests (or other code) to disable this trigger for the transaction
    public static Boolean triggerDisabledFlag;

    /*
        Checks to see if the trigger has been disabled either by custom setting or by running code
    */
    
    public Boolean IsDisabled()
    {
     //   triggerDisabledFlag = false;
      //  if(StaticData.DisabledTriggers!= null && StaticData.DisabledTriggers.contains('VV_OpportunityTriggerHandler')){
     //       system.debug('Skipping the Trigger run since TriggerDisable__c setting includes this trigger to skip');
     //       triggerDisabledFlag = true;
     //   }
        return false;
    }
 
    public void BeforeInsert(List<SObject> newItems) 
    {
        //VV_OpportunityTriggerHandler_Helper.beforeInsert((list<opportunity>)newItems);
    }
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
       // VV_OpportunityTriggerHandler_Helper.beforeUpdate((Map<Id,Opportunity>)newItems,(Map<Id,Opportunity>)oldItems);
    }
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {
        
    }
 
    public void AfterInsert(Map<Id, SObject> newItems) {
       // VV_OpportunityTriggerHandler_Helper.afterInsert((Map<Id,Opportunity>)newItems);
    }
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
       // VV_OpportunityTriggerHandler_Helper.afterUpdate((Map<Id,Opportunity>)newItems,(Map<Id,Opportunity>)oldItems);
    }
 
    public void AfterDelete(Map<Id, SObject> oldItems) {
       // VV_OpportunityTriggerHandler_Helper.afterDelete((Map<Id,Opportunity>)oldItems);
    }
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {
        
    }
}