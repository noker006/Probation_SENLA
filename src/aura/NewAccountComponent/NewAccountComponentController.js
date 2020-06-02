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
                        if (listRecordTypes.length == 1) {
                            component.set("v.selectedAccountRecordType", listRecordTypes[0].Id)
                            component.set("v.enableSelectRecordType", false);
                        }
                        let recordTypeOptions = [];
                        for (var i = 0; i < listRecordTypes.length; i++) {
                            recordTypeOptions.push({
                            label:listRecordTypes[i].Name,
                            value:listRecordTypes[i].Id
                            });
                        }
                        component.set("v.listRecordTypes" ,recordTypeOptions);
                    } else {
                        helper.sendToast("Failed with state: " + state, err[0].message);
                    }
                });
        $A.enqueueAction(action);
    },

    selectedTypeRecord:function (component, event, helper) {
        component.set("v.disabledNext",false);
        component.find("forceRecord").getNewRecord(
        "Account",
        component.get("v.selectedAccountRecordType"),
        false,
        $A.getCallback(function() {
            let rec = component.get("v.accountRecord");
            let error = component.get("v.newAccountError");
            if (error || (rec === null)) {
                helper.sendToast("Error initializing record template", error,"error");
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
           if (result.state === "SUCCESS") {
               helper.sendToast("OK","The record was saved.","error","success");
               helper.openCreatedRecord(component,result.recordId)
           } else if (result.state === "ERROR") {
               helper.sendToast("Error",JSON.stringify(result.error,"error"));
           } else {
               helper.sendToast('Unknown problem, state: ' + result.state,"Error "+ JSON.stringify(result.error),"error");
           }
       }));
    },

    closeModal : function(component, event, helper) {
        helper.closeModalWindow();
    },

    accountNameChanged: function(component, event, helper) {
        let accNameInput = component.find("accName");
        let accName = accNameInput.get("v.value");
        if (accName.length > 10 || (accName.charAt(0) != accName.charAt(0).toUpperCase())
        || (accName.match(/\d+/g) != null) ) {
            helper.setCustomValid(component,"The name must not exceed 10 characters, must start with a capital letter, and must not contain numbers",true);
        } else {
            helper.setCustomValid(component,'',false);
        }
    },

    goToAccountForm : function(component, event, helper) {
        component.set("v.enableSelectRecordType", false);
    }
});