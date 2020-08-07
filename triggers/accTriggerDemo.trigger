trigger accTriggerDemo on Account (before insert,after insert) {
    
    if(trigger.isInsert && trigger.isBefore)
    {
        accTriggerDemo_handler accHandler = new accTriggerDemo_handler();
        accHandler.setDescriptionBasedonIndustry(trigger.new);
    }
    if(trigger.isInsert && trigger.isAfter)
        accTriggerDemo_handler.secondMethod(trigger.new,trigger.old,trigger.newMap);
}