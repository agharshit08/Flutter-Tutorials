import 'package:flutter/material.dart';
import 'package:whatsapp_ui/constants.dart';
import 'package:whatsapp_ui/widgets/chat_list_widget.dart';

class HomeScreenMobile extends StatefulWidget {
  @override
  _HomeScreenMobileState createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
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
        indicatorColor: CustomColors.kGreyColor,
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
