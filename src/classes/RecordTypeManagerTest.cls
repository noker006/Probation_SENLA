/**
 * Created by ASUS on 02.06.2020.
 */

@IsTest
private class RecordTypeManagerTest {
    @IsTest
    static void testBehavior() {
        Test.startTest();
            List<RecordType> RT = RecordTypeManager.GetRecordTypeByName('Account');
        Test.stopTest();
        System.assertEquals(2,RT.size());
    }
}