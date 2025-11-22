import 'package:flutter/foundation.dart';

class ChatController extends ChangeNotifier {
  static final ChatController instance = ChatController._internal();
  ChatController._internal();

  void clear() {
    debugPrint("ChatController.clear() заглушка");
  }
}
