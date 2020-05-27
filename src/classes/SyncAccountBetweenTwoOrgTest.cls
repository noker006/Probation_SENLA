/**
 * Created by ASUS on 27.05.2020.
 */

@isTest
public with sharing class SyncAccountBetweenTwoOrgTest {
    @isTest
    public static void UpdateAndS2SAllAccountBatch_DefalValue() {
        List<Account> accounts = new List<Account>();
        for (Integer i=0;i<10;i++) {
            accounts.add(DataTestFactory.getAccountWithNoNotNowDate_SynchronizedByName('acc '+i));
        }
        insert accounts;
        Test.startTest();
        SyncAccountBetweenTwoOrg.Sync();
        Test.stopTest();
        System.assertEquals(10, [select count() from Account where Date_Synchronized__c =: Datetime.now()]);
    }
    @isTest
    public static void UpdateAndS2SAllAccountBatch_NoAccount() {
        Test.startTest();
        SyncAccountBetweenTwoOrg.Sync();
        Test.stopTest();
        System.assertEquals(0, [select count() from Account where Date_Synchronized__c =: Datetime.now()]);
    }
}