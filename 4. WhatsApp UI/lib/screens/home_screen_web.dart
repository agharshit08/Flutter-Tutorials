import 'package:flutter/material.dart';
import 'package:whatsapp_ui/constants.dart';
import 'package:whatsapp_ui/screens/chat_screen.dart';
import 'package:whatsapp_ui/widgets/chat_list_widget.dart';

class HomeScreenWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: CustomColors.kGreyColor.withOpacity(0.5),
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: Container(
                  color: CustomColors.kPrimaryColor,
                  height: screenHeight * 0.2,
                  width: screenWidth,
                )),
            Positioned(
              top: screenHeight * 0.05,
              bottom: screenHeight * 0.05,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              child: Container(
                height: screenHeight * 0.9,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: CustomColors.kLightColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    _buildLeftSide(screenWidth),
                    Container(
                        height: screenHeight * 0.9,
                        width: screenWidth * 0.65,
                        child: ChatScreen())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildLeftSide(double screenWidth) {
    return Container(
      width: screenWidth * 0.25,
      child: Column(
        children: [
          Container(
            height: 56.0,
            color: CustomColors.kGreyColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user.jpg'),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.star_outline_sharp,
                    color: CustomColors.kGreyColor,
                  ),
                  SizedBox(width: 15.0),
                  Icon(Icons.chat, color: CustomColors.kGreyColor),
                  SizedBox(width: 15.0),
                  Icon(Icons.more_vert, color: CustomColors.kGreyColor),
                  SizedBox(width: 15.0),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: CustomColors.kGreyColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 5.0),
                Icon(
                  Icons.search,
                  size: 25.0,
                  color: CustomColors.kGreyColor,
                ),
                SizedBox(width: 5.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: ChatList()),
        ],
      ),
    );
  }
}
