({
	calculateDate : function(component, event, helper) {
    let datetime = component.get("v.date");
    if (datetime != null){
        const date = Date.parse(datetime);
        component.set("v.dateString",date);
        component.set("v.showResult", true);
    }else{
        component.set( "v.showResult", false);
    }
    },

    checkForNull : function(component, event, helper){
    let date = component.get("v.date");
    if(date != null){
        component.set("v.buttonEnabled",false);
    }else{
        component.set("v.buttonEnabled", true);
        component.set("v.showResult",false);
        helper.Show($A.get("$Label.c.TimeDateContrErrorText"),$A.get("$Label.c.TitleError"));
    }
    }
})