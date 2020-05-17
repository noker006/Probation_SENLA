public with sharing class DataTestFactory {
    public static Account getAccountByName(string nameAcc){
        return new Account(Name = nameAcc);
    }
    public static FeedItem getFeedItemByType_ParentId(String typeFeedItem, Id parentId){
        FeedItem reqFeedItem = new FeedItem( Type = typeFeedItem , Body = 'Some Test Info', ParentId = parentId );
        return reqFeedItem;
    }
    public static Contact getContactByName(string nameCont){
        return new Contact( LastName = nameCont );
    }
}