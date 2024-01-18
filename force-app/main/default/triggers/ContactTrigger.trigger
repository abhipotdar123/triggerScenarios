trigger ContactTrigger on contact (before delete) {

    if(trigger.isBefore && trigger.isDelete){
        ContactTriggerHandler.beforeDelete(trigger.old);
    }
}