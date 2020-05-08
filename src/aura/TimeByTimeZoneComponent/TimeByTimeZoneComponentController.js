/**
 * Created by ASUS on 08.05.2020.
 */

({
    timeZoneChanged: function (component, event, helper) {
        let timeZone = component.get("v.timeZone")
        let action = component.get("c.getTimeByTimeZone");
        action.setParams({ "timeZone" : timeZone });
        action.setCallback(this, function(response) {
            let state = response.getState();
            let err =response.getError();
            if (state === "SUCCESS") {
                alert('SUCCESS');
                let dateTime = response.getReturnValue();
                if(dateTime == null) alert('invalid value');
                component.set("v.time",dateTime);
            }
            else {
                console.log("Failed with state: " + state);
                console.log("TableComponent err[0].message: " + err[0].message);
                alert('fail');
            }
        });
        $A.enqueueAction(action);
    },


})