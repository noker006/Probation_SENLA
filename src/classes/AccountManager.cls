/**
 * Created by ASUS on 15.05.2020.
 */

public class AccountManager {
    public static List<Account> getAllAccounts(){
        return [SELECT Id,CurrentDateTime__c,Date_Synchronized__c  FROM Account ];
    }
}