import 'package:flutter/material.dart';
import 'package:whatsapp_ui/constants.dart';
import 'package:whatsapp_ui/screens/chat_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSearchBar = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: showSearchBar ? _searchAppBar() : _normalAppBar(),
        body: TabBarView(
          children: <Widget>[
            ChatList(),
            Center(child: Text('Status')),
            Center(child: Text('Calls List')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: CustomColors.kSecondaryColor,
            child: Icon(Icons.chat),
            onPressed: () {}),
      ),
    );
  }

  AppBar _normalAppBar() {
    return AppBar(
      backgroundColor: CustomColors.kPrimaryColor,
      title: Text('WhatsApp'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(
              () {
                showSearchBar = true;
              },
            );
          },
        ),
        SizedBox(width: 10.0),
        Icon(Icons.more_vert),
      ],
      bottom: TabBar(
        indicatorColor: Colors.white,
        tabs: <Widget>[
          Tab(
            child: Text('Chats', style: CustomTextStyle.tabBarTextStyle),
          ),
          Tab(
            child: Text('Status', style: CustomTextStyle.tabBarTextStyle),
          ),
          Tab(
            child: Text('Calls', style: CustomTextStyle.tabBarTextStyle),
          )
        ],
      ),
    );
  }

  AppBar _searchAppBar() {
    return AppBar(
      backgroundColor: CustomColors.kLightColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: CustomColors.kPrimaryColor),
        onPressed: () {
          setState(() {
            showSearchBar = false;
          });
        },
      ),
      title: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
