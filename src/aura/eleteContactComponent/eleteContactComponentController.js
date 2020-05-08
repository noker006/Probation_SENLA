({
    R :function(component, event, helper) {
        let recordId = component.get("v.recordId");
        let sObject= component.get("v.sObject");
        if(recordId == null || sObject != "Account"){
        component.set("v.InValid",true);
        return;
        }
        let flow= component.find("deleteFlow");
        flow.startFlow("Delete_Contact_by_Email");
    }
})