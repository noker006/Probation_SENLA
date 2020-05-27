/**
 * Created by ASUS on 27.05.2020.
 */

@isTest
public with sharing class UpdateAndS2SAllAccountBatchTest {

    @isTest
    public static void UpdateAndS2SAllAccountBatch_DefalValue() {
        List<Account> accounts = new List<Account>();
        for (Integer i=0;i<10;i++) {
            accounts.add(DataTestFactory.getAccountWithNoNotNowDate_SynchronizedByName('acc '+i));
        }
        insert accounts;
        Test.startTest();
        Database.executeBatch(new UpdateAndS2SAllAccountBatch(), 1000);
        Test.stopTest();
        System.assertEquals(10, [select count() from Account where Date_Synchronized__c =: Datetime.now()]);
    }
    @isTest
    public static void UpdateAndS2SAllAccountBatch_NoAccount() {
        Test.startTest();
        Database.executeBatch(new UpdateAndS2SAllAccountBatch(), 1000);
        Test.stopTest();
        System.assertEquals(0, [select count() from Account where Date_Synchronized__c =: Datetime.now()]);
    }
}