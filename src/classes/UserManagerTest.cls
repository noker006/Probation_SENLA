/**
 * Created by ASUS on 27.05.2020.
 */

@IsTest
private class UserManagerTest {
    @IsTest
    public static void getUsers_UserWithGetToEmailSyncData() {
        User us = DataTestFactory.getUserByName('TesqweqweqwetU@gmwqeail.com');
        insert us;
        Test.startTest();
        List<User> users = UserManager.getUsers();
        Test.stopTest();
        System.assertEquals(1,users.size());
    }
    @IsTest
    public static void getUsers_NoUserWithGetToEmailSyncData() {
        Test.startTest();
        List<User> users = UserManager.getUsers();
        Test.stopTest();
        System.assertEquals(0,users.size());
    }
}