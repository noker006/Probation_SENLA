public class FeedItemManager  {
	public static List<FeedItem> getFeedItemsByType_ParentId(String typeFeedItem , Id sourceId) {
		List<FeedItem> trackedChangeFeedItems = new List<FeedItem>();
		if (String.isBlank(typeFeedItem) && String.isBlank(sourceId)) {
			return trackedChangeFeedItems;
		}
			trackedChangeFeedItems = [SELECT ID,Body,ParentId,Title,
			(SELECT ID, FieldName, OldValue, NewValue,FeedItemId
			FROM FeedTrackedChanges ORDER BY ID DESC)
			FROM FeedItem WHERE Type=: typeFeedItem AND ParentId =: sourceId];
		return trackedChangeFeedItems;
	}
}