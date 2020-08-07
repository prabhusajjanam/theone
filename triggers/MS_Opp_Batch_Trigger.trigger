trigger MS_Opp_Batch_Trigger on Opportunity (after insert) {
    
    Database.executeBatch(new MS_Opportunity_Batch(trigger.newmap.keyset()));

}