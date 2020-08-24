import 'package:whatsapp_ui/model/message.dart';

class Chat {
  final int chatId;
  final String memberOneNumber;
  final String memberTwoNumber;
  final String memberOneName;
  final String memberTwoName;
  final String memberOneProfilePicUrl;
  final String memberTwoProfilePicUrl;
  final List<Message> messagesList;

  Chat({
    this.chatId,
    this.memberOneNumber,
    this.memberTwoNumber,
    this.memberOneName,
    this.memberTwoName,
    this.memberOneProfilePicUrl,
    this.memberTwoProfilePicUrl,
    this.messagesList,
  });
}
