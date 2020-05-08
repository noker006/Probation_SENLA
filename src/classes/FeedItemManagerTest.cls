@isTest 
private class FeedItemManagerTest {

	@isTest
	public static void getFeedItemsByType_ParentId_DefaultValue() {
		Account acc = FactoryAccount.getAccountByName('Acc');
		insert acc;
		FeedItem feedItemAcc = FactoryFeedItem.getFeedItemByType_ParentId('TextPost', acc.Id);
		insert feedItemAcc; 
		Test.startTest();
			List<FeedItem> reqFeedItem = FeedItemManager.getFeedItemsByType_ParentId('TextPost',acc.Id);
		Test.stopTest();
		System.assertEquals(reqFeedItem.size(),1);
		System.assertEquals(reqFeedItem[0].Body,feedItemAcc.Body);
	}
	@isTest
	public static void getFeedItemsByType_ParentId_EmptyFeedItem() {
		Account acc = FactoryAccount.getAccountByName('Acc');
		insert acc;
		Test.startTest();
			List<FeedItem> reqFeedItem = FeedItemManager.getFeedItemsByType_ParentId('TextPost',acc.Id);
		Test.stopTest();
		System.assertEquals(reqFeedItem.size(),0);
	}
	@isTest
	public static void getFeedItemsByType_ParentId_Null() {
		Test.startTest();
			List<FeedItem> reqFeedItem = FeedItemManager.getFeedItemsByType_ParentId(null,null);
		Test.stopTest();
		System.assertEquals(reqFeedItem.size(),0);
	}
	@isTest
	public static void getFeedItemsByType_ParentId_EmptyContentId() {
		Account acc = FactoryAccount.getAccountByName('Acc');
		Test.startTest();
			List<FeedItem> reqFeedItem = FeedItemManager.getFeedItemsByType_ParentId('TextPost',acc.Id);
		Test.stopTest();
		System.assertEquals(reqFeedItem.size(),0);
	}
}