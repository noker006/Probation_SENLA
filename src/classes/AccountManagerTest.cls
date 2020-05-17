/**
 * Created by ASUS on 15.05.2020.
 */

@isTest
public with sharing class AccountManagerTest {
    @isTest
    public static void setCurrentDateTime_DefaultValue() {
        Account acc = DataTestFactory.getAccountByName('Acc');
        insert acc;
        Test.startTest();
        List<Account> accounts = AccountManager.getAllAccounts();
        Test.stopTest();
        System.assertEquals(accounts.size(),1);
    }
    @isTest
    public static void setCurrentDateTime_NoAccount() {
        Test.startTest();
        List<Account> accounts = AccountManager.getAllAccounts();
        Test.stopTest();
        System.assertEquals(accounts.size(),0);
    }
}