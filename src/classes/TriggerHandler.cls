public virtual class TriggerHandler {
    
    protected virtual void afterInsert(){}
	protected virtual void beforInsert(){}
    protected virtual void afterUpdate(){}
    protected virtual void beforUpdate(){}
    protected virtual void afterDelete(){}
    protected virtual void beforDelete(){}

public void run(){
        if(Trigger.isBefore && Trigger.isInsert){
beforInsert();
}else if (Trigger.isAfter && Trigger.isInsert){
afterInsert();
}else if (Trigger.isBefore && Trigger.isUpdate){
 beforUpdate();
}else if (Trigger.isAfter && Trigger.isUpdate){
afterUpdate();
}else if (Trigger.isBefore && Trigger.isDelete){
beforDelete();
}else if (Trigger.isAfter && Trigger.isUndelete){
}else if (Trigger.isBefore && Trigger.isUndelete){
}
   } 
}