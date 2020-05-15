/**
 * Created by ASUS on 15.05.2020.
 */

public with sharing class AccountController {
    @InvocableMethod
    public static void setCurrentDateTime(){
        List<Account> allAccounts = AccountManager.getAllAccounts();
        if (!allAccounts.isEmpty()) {
            for (Account acc : allAccounts) {
                acc.CurrentDateTime__c = Datetime.now();
            }
            try {
                update allAccounts;
            } catch (DmlException e) {
                System.debug('The following  exceptionhas occurred: ' + e.getMessage());
            }
        }
    }
}