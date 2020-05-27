/**
 * Created by ASUS on 26.05.2020.
 */

@isTest
public with sharing class MessagingControllerTest {
    @isTest
    public static void sendMessage_DefaultValue() {
        User us = DataTestFactory.getUserByName('TesqweqweqwetU@gmwqeail.com');
        insert us;
        Test.startTest();
        List<Messaging.SendEmailResult> results = MessagingController.sendMessage(new List<User>{us},'text');
        Test.stopTest();
        System.assertEquals(1,results.size());
    }
    @isTest
    public static void sendMessage_NoUsers() {
        Test.startTest();
        List<Messaging.SendEmailResult> results = MessagingController.sendMessage(new List<User>(),'text');
        Test.stopTest();
        System.assertEquals(0,results.size());
    }
}