/**
 * Created by ASUS on 08.05.2020.
 */

@IsTest
private class TimeControllerTest {
    @IsTest
    static public void getTimeByTimeZone_Null() {

        Test.startTest();
            Datetime dTime = TimeController.getTimeByTimeZone(null);
        Test.stopTest();

        System.assertEquals(dTime,null);
    }
    @IsTest
    static public void getTimeByTimeZone_MoreThan12() {

        Test.startTest();
        Datetime dTime = TimeController.getTimeByTimeZone(13);
        Test.stopTest();

        System.assertEquals(dTime,null);
    }
    @IsTest
    static public void getTimeByTimeZone_LessThanMinus12() {

        Test.startTest();
        Datetime dTime = TimeController.getTimeByTimeZone(-13);
        Test.stopTest();

        System.assertEquals(dTime,null);
    }
}