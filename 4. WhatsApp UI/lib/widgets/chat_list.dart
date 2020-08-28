import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/data/chat_data.dart';
import 'package:whatsapp_ui/functions/custom_function.dart';
import 'package:whatsapp_ui/model/message.dart';
import 'package:whatsapp_ui/provider/chat_provider.dart';
import 'package:whatsapp_ui/screens/chat_screen.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.grey,
        thickness: 0.2,
      ),
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        final messagesList = chats[index].messagesList;
        final Message lastMessage = messagesList[messagesList.length - 1];
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(chats[index].memberTwoProfilePicUrl),
          ),
          title: Text(
            chats[index].memberTwoName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          subtitle: Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Text(
              lastMessage.text,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          trailing: Text(
            lastMessage.time,
            style: TextStyle(fontSize: 15.0, color: Colors.grey),
          ),
          onTap: () {
            Provider.of<ChatProvider>(context, listen: false)
                .updateChatIndex(index);
            if (CustomFunctions.isMobile(context)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChatScreen();
                  },
                ),
              );
            }
          },
        );
      },
    );
  }
}
