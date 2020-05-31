/**
 * Created by ASUS on 30.05.2020.
 */

({
    doInit:function (component, event, helper) {
        let action = component.get("c.getAccountRecordTypes");
        action.setCallback(this, function(response) {
                    let state = response.getState();
                    let err =response.getError();
                    if (state === "SUCCESS") {
                        let listRecordTypes = response.getReturnValue();
                        component.set("v.listRecordTypes" ,listRecordTypes);
                    }
                    else {
                        console.log("Failed with state: " + state);
                        console.log("TableComponent err[0].message: " + err[0].message);
                    }
                });
        $A.enqueueAction(action);
    },
    selectedTypeRecord:function (component, event, helper) {
        console.log(component.get("v.selectedAccountRecordType"));
        component.set("v.enableAccountForm", true);
        component.find("forceRecord").getNewRecord(
        "Account",
        component.get("v.selectedAccountRecordType"),
        false,
        $A.getCallback(function() {
            let rec = component.get("v.accountRecord");
            let error = component.get("v.newAccountError");
            if (error || (rec === null)) {
                console.log("Error initializing record template: " + error);
                alert('err');
                return;
            }
        })
    );
    },
    insertNewAccount:function(component, event, helper) {
        component.set("v.accountRecord.Name", component.find('accName').get("v.value"));
        component.set("v.accountRecord.Phone", component.find('accPhone').get("v.value"));
        component.set("v.accountRecord.Fax",  component.find('accFax').get("v.value"));
        component.set("v.accountRecord.AccountNumber", component.find('accNumber').get("v.value"));
        component.set("v.accountRecord.Site", component.find('accSite').get("v.value"));
        let tempRec = component.find("forceRecord");
        tempRec.saveRecord($A.getCallback(function(result) {
           console.log(result.state);
           let  resultsToast = $A.get("e.force:showToast");
           if (result.state === "SUCCESS") {
               resultsToast.setParams({
                   "title": "OK",
                   "message": "The record was saved."
               });
               resultsToast.fire();
               helper.closeModalWindow();
           } else if (result.state === "ERROR") {
               console.log('Error: ' + JSON.stringify(result.error));
               resultsToast.setParams({
                   "title": "Error",
                   "message": "There was an error saving the record: " + JSON.stringify(result.error)
               });
               resultsToast.fire();
           } else {
               console.log('Unknown problem, state: ' + result.state + ', error: ' + JSON.stringify(result.error));
           }
       }));
    },
    closeModal : function(component, event, helper) {
        helper.closeModalWindow();
    },
    accountNameChanged: function(component, event, helper) {
        let accNameInput = component.find("accName");
        let accName = accNameInput.get("v.value");
        console.log('In accountNameChanged(accNameInput): ');
        console.log(accName);
        console.log(accName.charAt(0).toUpperCase());
        if (accName.length > 10 || (accName.charAt(0) != accName.charAt(0).toUpperCase())
        || (accName.match(/\d+/g) != null) ) {

            accNameInput.setCustomValidity('Enter norm Account');
            accNameInput.reportValidity();
            component.set("v.disabledSubmit", true);

        }
        else {
            accNameInput.setCustomValidity('');
            accNameInput.reportValidity();
            component.set("v.disabledSubmit", false);
        }
    }
});