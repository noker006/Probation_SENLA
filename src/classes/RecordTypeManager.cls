/**
 * Created by ASUS on 30.05.2020.
 */

public with sharing class RecordTypeManager {
    @AuraEnabled
    public static List<RecordType> GetRecordTypeByName(String nameFrom){
        return Database.query('SELECT Id,Name FROM RecordType WHERE sObjectType=: nameFrom');
    }
}