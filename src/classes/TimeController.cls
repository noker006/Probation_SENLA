/**
 * Created by ASUS on 08.05.2020.
 */

public with sharing class TimeController {
    @AuraEnabled
    public static DateTime getTimeByTimeZone(Integer timeZone){
        if(timeZone == null|| timeZone > 12|| timeZone < -12 ) return null;
        return Datetime.now().addHours(timeZone);
    }
}