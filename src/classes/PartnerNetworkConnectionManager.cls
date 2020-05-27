/**
 * Created by ASUS on 24.05.2020.
 */

public class PartnerNetworkConnectionManager {
    public static List<PartnerNetworkConnection> getAllAcceptedPartnerNetworkConnection(){
        return [select Id, ConnectionStatus, ConnectionName from PartnerNetworkConnection
        where ConnectionStatus = 'Accepted' AND ConnectionName = 'Senla'];
    }
}