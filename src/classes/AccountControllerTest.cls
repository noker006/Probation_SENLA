/**
 * Created by ASUS on 15.05.2020.
 */

public with sharing class AccountControllerTest {
    @isTest
    public static void setCurrentDateTime_DefaultValue() {
        Account acc = DataTestFactory.getAccountByName('Acc');
        insert acc;
        FeedItem feedItemAcc = DataTestFactory.getFeedItemByType_ParentId('TextPost', acc.Id);
        insert feedItemAcc;
        Test.startTest();
        List<FeedItem> reqFeedItem = FeedItemManager.getFeedItemsByType_ParentId('TextPost',acc.Id);
        Test.stopTest();
        System.assertEquals(reqFeedItem.size(),1);
        System.assertEquals(reqFeedItem[0].Body,feedItemAcc.Body);
    }
}