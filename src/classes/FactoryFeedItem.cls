public class FactoryFeedItem  {
	public static FeedItem getFeedItemByType_ParentId(String typeFeedItem, Id parentId){
		FeedItem reqFeedItem = new FeedItem( Type = typeFeedItem , Body = 'Some Test Info', ParentId = parentId );
		return reqFeedItem;
	}
}