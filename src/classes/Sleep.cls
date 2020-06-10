public class Sleep  {

	public static void sleep(Long milliSeconds)
	{
        Long timeDiff = 0;
        DateTime firstTime = System.now();
        do
        {
            timeDiff = System.now().getTime() - firstTime.getTime();
        }
        while(timeDiff <= milliSeconds);
	}
	
	public static List<FeedItem> getFeedItem(Id id){

	List<FeedItem>  feedItems = [SELECT ID,Body,ParentId,Title,(SELECT ID, FieldName, OldValue, NewValue FROM FeedTrackedChanges ORDER BY ID DESC)
	FROM FeedItem WHERE Type='TrackedChange' AND ParentId =: id];
	return feedItems;
	}

}