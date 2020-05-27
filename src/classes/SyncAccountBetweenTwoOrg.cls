/**
 * Created by ASUS on 24.05.2020.
 */

public class SyncAccountBetweenTwoOrg {
    @InvocableMethod
    public static void Sync(){
        Database.executeBatch(new UpdateAndS2SAllAccountBatch(), 20000);
    }
}