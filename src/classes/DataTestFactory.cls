public with sharing class DataTestFactory {
    public static Account getAccountByName(string nameAcc){
        return new Account(Name = nameAcc);
    }
    public static Account getAccountWithNoNotNowDate_SynchronizedByName(String nameAcc){
        return new Account(Name = nameAcc , Date_Synchronized__c = DateTime.newInstance(2006,
                11, 19, 3, 3, 3));
    }
    public static FeedItem getFeedItemByType_ParentId(String typeFeedItem, Id parentId){
        FeedItem reqFeedItem = new FeedItem( Type = typeFeedItem , Body = 'Some Test Info', ParentId = parentId );
        return reqFeedItem;
    }
    public static Contact getContactByName(string nameCont){
        return new Contact( LastName = nameCont );
    }
    public static User getUserByName(string nameUser){
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        return new User( Alias = 'standt',ProfileId = p.Id, Email='standarqduser@testorg.com',
                EmailEncodingKey='UTF-8', LastName= 'Testing', LanguageLocaleKey='en_US', Username=nameUser,
                LocaleSidKey='en_US', TimeZoneSidKey='America/Los_Angeles',  getToEmailSyncData__c = true);
    }
}