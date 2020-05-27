/**
 * Created by ASUS on 26.05.2020.
 */
global class UpdateAndS2SAllAccountBatch implements Database.Batchable<sObject>, Database.Stateful {

    private String emailMessage = 'Errors: ';
    private List<PartnerNetworkConnection> allConnections;

    global UpdateAndS2SAllAccountBatch() {
        allConnections = PartnerNetworkConnectionManager.getAllAcceptedPartnerNetworkConnection();
    }

    global Database.QueryLocator start(Database.BatchableContext bt) {
        return Database.getQueryLocator('SELECT Id,Date_Synchronized__c  FROM Account ');
    }

    global void execute(Database.BatchableContext bt, List<Account> accounts) {
        if (!allConnections.isEmpty() && !accounts.isEmpty()) {
            List<PartnerNetworkRecordConnection> allRecordConnection = new List<PartnerNetworkRecordConnection>();
            for (PartnerNetworkConnection connection : allConnections) {
                for (Account acc : accounts) {
                    allRecordConnection.add(new PartnerNetworkRecordConnection(ConnectionId = connection.Id,
                            LocalRecordId = acc.Id, RelatedRecords = 'Contact',
                            SendEmails = true));
                    acc.Date_Synchronized__c = Datetime.now();
                }
            }
            fillErrorMesssage(Database.update(accounts, false));
            fillErrorMesssage(Database.insert(allRecordConnection,false) );
        }
    }
    private void fillErrorMesssage(List<DAtaBase.SaveResult> results) {
        for (DAtaBase.SaveResult res : results) {
            for (Database.Error err : res.getErrors()){
                emailMessage += err.getMessage()+' ';
            }
        }
    }


    global void finish(Database.BatchableContext bt) {
        if(emailMessage == 'Errors: '){
            emailMessage = 'Ok';
        }
        MessagingController.sendMessage(UserManager.getUsers(), emailMessage);
    }


}
