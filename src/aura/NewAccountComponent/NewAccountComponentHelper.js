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
    }
});