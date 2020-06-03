/**
 * Created by ASUS on 02.06.2020.
 */

@IsTest
private class RecordTypeControllerTest {
    @IsTest
    static void testBehavior() {
        Test.startTest();
            List<RecordType> RT = RecordTypeController.getAccountRecordTypes();
        Test.stopTest();
        System.assertEquals(2,RT.size());
    }
}