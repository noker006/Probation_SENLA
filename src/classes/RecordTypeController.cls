/**
 * Created by ASUS on 30.05.2020.
 */

public without sharing class RecordTypeController {
    @AuraEnabled
    public static List<RecordType> getAccountRecordTypes(){
        return RecordTypeManager.GetRecordTypeByName('Account');
    }
}