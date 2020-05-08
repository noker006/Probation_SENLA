({
    saveNameRecord : function(component, event, helper) {
        component.find("contactRecordEditor").saveRecord($A.getCallback(function(saveResult) {}));
    },
    handleRecordUpdated: function(component, event, helper) {
        var eventParams = event.getParams();
        if(eventParams.changeType === "CHANGED") {
            var resultsToast = $A.get("e.force:showToast");
            resultsToast.setParams({
                "title": "Saved",
                "message": "The record was updated."
            });
            resultsToast.fire();
        } else if(eventParams.changeType === "LOADED") {
        } else if(eventParams.changeType === "REMOVED") {
        } else if(eventParams.changeType === "ERROR") {
            console.log('Error: ' + component.get("v.error"));
        }
    }
})