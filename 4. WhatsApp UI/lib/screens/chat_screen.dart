import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/constants.dart';
import 'package:whatsapp_ui/data/chat_data.dart';
import 'package:whatsapp_ui/functions/custom_function.dart';
import 'package:whatsapp_ui/model/chat.dart';
import 'package:whatsapp_ui/model/message.dart';
import 'package:whatsapp_ui/provider/chat_provider.dart';
import 'package:whatsapp_ui/widgets/chat_message_widget.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen();
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 500.0);
  List<Message> messagesList = [];
  String friendName;
  String imageUrl;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildMessagesList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: messagesList.length,
        itemBuilder: (ctx, index) {
          return ChatMessageWidget(messagesList[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Chat chat =
        chats[Provider.of<ChatProvider>(context).currentChatIndex];
    messagesList = chat.messagesList;
    friendName = chat.memberTwoName;
    imageUrl = chat.memberTwoProfilePicUrl;

    return CustomFunctions.isMobile(context)
        ? Scaffold(
            body: _buildChat(context),
          )
        : _buildChat(context);
  }

  Container _buildChat(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          _buildAppBar(context),
          _buildMessagesList(context),
          _buildMessageComposer()
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    final textField = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 5.0),
          Icon(
            Icons.insert_emoticon,
            size: 25.0,
            color: Colors.grey,
          ),
          SizedBox(width: 5.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(
            Icons.attach_file,
            size: 25.0,
            color: Colors.grey,
          ),
          SizedBox(width: 8.0),
          Icon(
            Icons.camera_alt,
            size: 25.0,
            color: Colors.grey,
          ),
          SizedBox(width: 8.0),
        ],
      ),
    );
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: textField,
          ),
          SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              child: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    bool isMobile = CustomFunctions.isMobile(context);
    return AppBar(
      backgroundColor:
          isMobile ? CustomColors.kPrimaryColor : CustomColors.kGreyColor,
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomFunctions.isMobile(context)
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : SizedBox(
                  width: 10.0,
                ),
          CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage(imageUrl),
          ),
          SizedBox(width: 10.0),
          Text(
            friendName,
            style: TextStyle(
                color: isMobile ? CustomColors.kLightColor : Colors.black),
          ),
        ],
      ),
      actions: [
        Icon(Icons.video_call,
            color:
                isMobile ? CustomColors.kLightColor : CustomColors.kIconColor),
        SizedBox(width: 15.0),
        Icon(Icons.call,
            color:
                isMobile ? CustomColors.kLightColor : CustomColors.kIconColor),
        SizedBox(width: 15.0),
        Icon(Icons.more_vert,
            color:
                isMobile ? CustomColors.kLightColor : CustomColors.kIconColor)
      ],
    );
  }
}
