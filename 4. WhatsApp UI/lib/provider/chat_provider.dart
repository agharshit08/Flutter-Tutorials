import 'package:flutter/cupertino.dart';

class ChatProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentChatIndex => _currentIndex;

  void updateChatIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
