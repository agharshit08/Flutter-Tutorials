import 'package:flutter/material.dart';
import 'package:whatsapp_ui/constants.dart';
import 'package:whatsapp_ui/model/message.dart';
import 'package:whatsapp_ui/widgets/chat_message_widget.dart';

class ChatScreen extends StatefulWidget {
  final List<Message> messagesList;
  final String friendName;
  final String imageUrl;
  ChatScreen({this.messagesList, this.friendName, this.imageUrl});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 500.0);

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildMessagesList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.messagesList.length,
        itemBuilder: (ctx, index) {
          return ChatMessageWidget(widget.messagesList[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        height: screenHeight,
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
            _buildMessagesList(context),
            _buildMessageComposer(screenHeight)
          ],
        ),
      ),
    );
  }

  Widget _buildMessageComposer(double screenHeight) {
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
    return AppBar(
      backgroundColor: CustomColors.kPrimaryColor,
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage(widget.imageUrl),
          ),
          SizedBox(width: 10.0),
          Text(widget.friendName),
        ],
      ),
      actions: [
        Icon(Icons.video_call),
        SizedBox(width: 15.0),
        Icon(Icons.call),
        SizedBox(width: 15.0),
        Icon(Icons.more_vert)
      ],
    );
  }
}
