import 'package:flutter/material.dart';
import 'package:whatsapp_ui/data/chat_data.dart';
import 'package:whatsapp_ui/model/message.dart';
import 'package:whatsapp_ui/screens/chat_screen.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        final messagesList = chats[index].messagesList;
        final Message lastMessage = messagesList[messagesList.length - 1];

        return Column(
          children: [
            ListTile(
              contentPadding:
                  EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage:
                    AssetImage(chats[index].memberTwoProfilePicUrl),
              ),
              title: Text(
                chats[index].memberTwoName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(
                  lastMessage.text,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              trailing: Text(
                lastMessage.time,
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(
                      friendName: chats[index].memberTwoName,
                      imageUrl: chats[index].memberTwoProfilePicUrl,
                      messagesList: chats[index].messagesList,
                    ),
                  ),
                );
              },
            ),
            Divider()
          ],
        );
      },
    );
  }
}
