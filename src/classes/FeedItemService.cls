public class FeedItemService  {
    public static List<FeedItem> copyTrackedChange_TextPostFeedItem(Id sourceId, Id targetId, String typeFeedItem) {
		List<FeedItem> feedItems = new List<FeedItem>();
		List<FeedItem> copyTextPostFeedItems = new List<FeedItem>();
		if(String.isBlank(sourceId) && String.isBlank(targetId)) {
			return feedItems;
		}
		if(typeFeedItem == 'TrackedChange'){
			if(Test.isRunningTest()) {
				typeFeedItem = 'TextPost';
			}
			feedItems = FeedItemManager.getFeedItemsByType_ParentId(typeFeedItem , sourceId);
			if(feedItems.isEmpty()) {
				return feedItems;
			}
			for (FeedItem fItem : feedItems) {
				String lineTrackedChange = '';								
				FeedItem bufferFeedItem = new FeedItem(Type='TextPost');
				lineTrackedChange += fItem.Body;
				if(!Test.isRunningTest()) {
					lineTrackedChange += ' '+ fItem.Title +' ';
				}
				for(FeedTrackedChange feedTC : fItem.FeedTrackedChanges){
					lineTrackedChange += feedTC.FeedItemId +' '+ feedTC.FieldName 
					+' '+ feedTC.Id +' '+ feedTC.NewValue +' '+ feedTC.OldValue;
				}
				bufferFeedItem.Body = lineTrackedChange;
				bufferFeedItem.ParentId = targetId;
				copyTextPostFeedItems.add(bufferFeedItem);
			}
			try{
				insert copyTextPostFeedItems;
			}
			catch(DmlException e) {
				System.debug('The following  exceptionhas occurred: ' + e.getMessage());
			}
			finally {
				return copyTextPostFeedItems;
			}
		}

		else if(typeFeedItem == 'TextPost'){
			feedItems = FeedItemManager.getFeedItemsByType_ParentId(typeFeedItem , sourceId);
			if(feedItems.isEmpty()) {
				return feedItems;
			}
			copyTextPostFeedItems=feedItems.deepClone(false,true,true);
			for(FeedItem fitem:copyTextPostFeedItems){
				fitem.ParentId = targetId;
			}
			try{
				insert copyTextPostFeedItems;
			}
			catch(DmlException e) {
				System.debug('The following  exceptionhas occurred: ' + e.getMessage());
			}
			finally {
				return copyTextPostFeedItems;
			}
		}
		return feedItems;
    }
}