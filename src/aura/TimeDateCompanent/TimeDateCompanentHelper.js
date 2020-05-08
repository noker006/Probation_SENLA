({
Show : function(messageText, titleText) {
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
    "title": titleText,
    "message": messageText});
    toastEvent.fire();
}
})