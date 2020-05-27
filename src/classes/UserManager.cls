/**
 * Created by ASUS on 24.05.2020.
 */

public class UserManager {
    public static List<User> getUsers(){
        return [SELECT Id, Email, Name FROM User WHERE getToEmailSyncData__c = true];
    }
}