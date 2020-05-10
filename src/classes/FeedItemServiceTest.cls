@isTest 
private class FeedItemServiceTest {
	@isTest
	public static void copyTrackedChangeFeedItem_DefaultValue() {
		Account acc1 = DataTestFactory.getAccountByName('Acc1');	
		insert acc1;				
		Account acc2 = DataTestFactory.getAccountByName('Acc2');
		insert acc2;
	    FeedItem feedItemAcc1 = DataTestFactory.getFeedItemByType_ParentId('TextPost', acc1.Id);
		insert feedItemAcc1;

        Test.startTest();
			List<FeedItem> feedItemsAcc2 = FeedItemService.copyTrackedChange_TextPostFeedItem(acc1.Id , acc2.Id , 'TrackedChange');
		Test.stopTest();

		System.assertEquals(1,feedItemsAcc2.size());
		System.assertEquals(feedItemAcc1.Body,feedItemsAcc2[0].Body);
        System.assertEquals(acc2.Id,feedItemsAcc2[0].ParentId);
	}
	@IsTest 
	public static void copyTextPostFeedItem_DefaultValue(){
		Account acc1 = DataTestFactory.getAccountByName('Acc1');	
		insert acc1;				
		Account acc2 = DataTestFactory.getAccountByName('Acc2');
		insert acc2;
	    FeedItem feedItemAcc1 = DataTestFactory.getFeedItemByType_ParentId('TextPost' , acc1.Id);
		insert feedItemAcc1;

		Test.startTest();
			List<FeedItem> feedItemsAcc2 = FeedItemService.copyTrackedChange_TextPostFeedItem(acc1.Id , acc2.Id , 'TextPost');
		Test.stopTest();

		System.assertEquals(1,feedItemsAcc2.size());
		System.assertEquals(feedItemAcc1.Body,feedItemsAcc2[0].Body);
        System.assertEquals(acc2.Id,feedItemsAcc2[0].ParentId);
	}

	@IsTest 
	public static void copyTextPostFeedItem_EmptyContentId(){
		Account acc1 = DataTestFactory.getAccountByName('Acc1');	
		Account acc2 = DataTestFactory.getAccountByName('Acc2');

		Test.startTest();
			List<FeedItem> feedItemsAcc2 = FeedItemService.copyTrackedChange_TextPostFeedItem(  acc1.Id , acc2.Id  , 'TextPost');
		Test.stopTest();

		System.assertEquals(0,feedItemsAcc2.size());
	}

	@IsTest 
	public static void copyTextPostFeedItem_InvalidFeedItemType(){
		Account acc1 = DataTestFactory.getAccountByName('Acc1');	
		insert acc1;				
		Account acc2 = DataTestFactory.getAccountByName('Acc2');
		insert acc2;
	    FeedItem feedItemAcc1 = DataTestFactory.getFeedItemByType_ParentId('TextPost' , acc1.Id);
		insert feedItemAcc1;

		Test.startTest();
			List<FeedItem> feedItemsAcc2 = FeedItemService.copyTrackedChange_TextPostFeedItem( acc1.Id , acc2.Id , 'beleberda');
		Test.stopTest();

		System.assertEquals(0,feedItemsAcc2.size());
	}

	@IsTest
	public static void copyTextPostFeedItem_AccountContact(){
		Account acc1 = DataTestFactory.getAccountByName('Acc1');	
		insert acc1;				
		Contact cont = DataTestFactory.getContactByName('cont');
		insert cont;
	    FeedItem feedItemAcc1 = DataTestFactory.getFeedItemByType_ParentId('TextPost' , acc1.Id);
		insert feedItemAcc1;

		Test.startTest();
			List<FeedItem> feedItemsCont = FeedItemService.copyTrackedChange_TextPostFeedItem( acc1.Id , cont.Id , 'TextPost');
		Test.stopTest();

		System.assertEquals(1,feedItemsCont.size());
		System.assertEquals(feedItemAcc1.Body,feedItemsCont[0].Body);
        System.assertEquals(cont.Id,feedItemsCont[0].ParentId);
	}
}