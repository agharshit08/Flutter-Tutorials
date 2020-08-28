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
  String friendName;
  String imageUrl;
  List<Message> messagesList;
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 500.0);

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Chat chat =
        chats[Provider.of<ChatProvider>(context).currentChatIndex];
    friendName = chat.memberTwoName;
    imageUrl = chat.memberTwoProfilePicUrl;
    messagesList = chat.messagesList;

    return CustomFunctions.isMobile(context)
        ? Scaffold(
            body: _buildChat(),
          )
        : _buildChat();
  }

  Container _buildChat() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          _buildAppBar(context),
          _buildMessagesList(),
          _buildMessageComposer()
        ],
      ),
    );
  }

  Expanded _buildMessagesList() {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: messagesList.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatMessageWidget(messagesList[index]);
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: CustomFunctions.isMobile(context)
          ? CustomColors.kPrimaryColor
          : CustomColors.kGreyColor,
      titleSpacing: 0.0,
      title: Row(
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
            backgroundImage: AssetImage(imageUrl),
            radius: 20,
          ),
          SizedBox(width: 10.0),
          Text(
            friendName,
            style: TextStyle(
              color: CustomFunctions.isMobile(context)
                  ? CustomColors.kLightColor
                  : Colors.black,
            ),
          )
        ],
      ),
      actions: [
        Icon(
          Icons.video_call,
          color: CustomFunctions.isMobile(context)
              ? CustomColors.kLightColor
              : CustomColors.kIconColor,
        ),
        SizedBox(width: 15.0),
        Icon(
          Icons.call,
          color: CustomFunctions.isMobile(context)
              ? CustomColors.kLightColor
              : CustomColors.kIconColor,
        ),
        SizedBox(width: 15.0),
        Icon(
          Icons.more_vert,
          color: CustomFunctions.isMobile(context)
              ? CustomColors.kLightColor
              : CustomColors.kIconColor,
        ),
      ],
    );
  }

  Widget _buildMessageComposer() {
    final textField = Container(
      decoration: BoxDecoration(
        color: CustomColors.kLightColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          SizedBox(width: 8.0),
          Icon(Icons.insert_emoticon, color: CustomColors.kIconColor,),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Type a message...', border: InputBorder.none),
            ),
          ),
          Icon(Icons.attach_file, color: CustomColors.kIconColor,),
          Icon(Icons.camera_alt, color: CustomColors.kIconColor,),
          SizedBox(width: 8.0)
        ],
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: textField),
          SizedBox(width: 8.0),
          CircleAvatar(
            child: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
