/**
 * Created by ASUS on 24.05.2020.
 */

public class MessagingController {
    public static List<Messaging.SendEmailResult> sendMessage(List<User> users, String messageBody){
        if(users != null && !users.isEmpty() && !String.isBlank(messageBody)) {
            List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
            for (User us : users) {
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.toAddresses = new String[]{
                        us.Email
                };
                message.subject = 'To ' + us.Name;
                message.plainTextBody = messageBody;
                messages.add(message);
            }
            return Messaging.sendEmail(messages);
        }
        return new List<Messaging.SendEmailResult>();
    }
}