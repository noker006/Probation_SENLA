/**
 * Created by ASUS on 27.05.2020.
 */

@IsTest
private class PartnerNetworkConnectionManagerTest {
    @isTest
    public static void setCurrentDateTime_NoPartnerNetworkConnection() {
        Test.startTest();
        List<PartnerNetworkConnection> pNC = PartnerNetworkConnectionManager.getAllAcceptedPartnerNetworkConnection();
        Test.stopTest();
        System.assertEquals(1,pNC.size());
    }
}