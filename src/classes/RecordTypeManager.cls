/**
 * Created by ASUS on 30.05.2020.
 */

public with sharing class RecordTypeManager {
    @AuraEnabled
    public static List<RecordType> GetRecordTypeByName(String nameFrom){
        List<String> recordTypeIds = new List<String>();
        List<Schema.RecordTypeInfo> recordTypeInfoList = Account.SObjectType.getDescribe().getRecordTypeInfos();
        for( Schema.RecordTypeInfo recordType : recordTypeInfoList )
        {
            if(recordType.isAvailable())
            {
                recordTypeIds.add(recordType.getRecordTypeId());
            }
        }
        if(recordTypeIds.isEmpty()){
            return new List<RecordType>();
        }
        return Database.query('SELECT Id,Name,IsActive,SobjectType FROM RecordType WHERE sObjectType=: nameFrom AND Id IN : recordTypeIds');
    }
}