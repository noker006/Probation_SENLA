/**
 * Created by ASUS on 31.05.2020.
 */

({
    closeModalWindow: function() {
        let homeEvt = $A.get("e.force:navigateToObjectHome");
                homeEvt.setParams({
                    "scope": "Account"
                });
        homeEvt.fire();
    },
    sendToast: function(title,message,type) {
        let  resultsToast = $A.get("e.force:showToast");
        resultsToast.setParams({
            "title": title,
            "type": type,
            "message": message,
        });
        resultsToast.fire();
    },
    setCustomValid: function(component,errorMess,disabledSubmit) {
        let accNameInput = component.find("accName");
        accNameInput.setCustomValidity(errorMess);
        accNameInput.reportValidity();
        component.set("v.disabledSubmit", disabledSubmit);
    },
    openCreatedRecord: function(component,recordId) {
        let navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": recordId
        });
        navEvt.fire();
    }
});