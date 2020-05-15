/**
 * Created by ASUS on 15.05.2020.
 */

public with sharing class AccountManager {
    public static List<Account> getAllAccounts(){
        return [SELECT Id,CurrentDateTime__c  FROM Account ];
    }
}