/**
 * Created by ASUS on 15.05.2020.
 */
@isTest
public with sharing class AccountControllerTest {
    @isTest
    public static void setCurrentDateTime_DefaultValue() {
        Account acc = DataTestFactory.getAccountByName('Acc');
        insert acc;
        Test.startTest();
        AccountController.setCurrentDateTime();
        Test.stopTest();
        List<Account> accounts = [SELECT Id,CurrentDateTime__c,CheckedFromTask4__c FROM Account];
        System.assertEquals(accounts.size(),1);
        System.assertEquals(accounts[0].CheckedFromTask4__c,true);
    }
    @isTest
    public static void setCurrentDateTime_NoAccount() {
        Test.startTest();
        AccountController.setCurrentDateTime();
        Test.stopTest();
        List<Account> accounts = [SELECT Id,CurrentDateTime__c,CheckedFromTask4__c FROM Account];
        System.assertEquals(accounts.size(),0);
    }
}