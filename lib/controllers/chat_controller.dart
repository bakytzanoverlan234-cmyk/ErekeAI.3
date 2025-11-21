import 'package:flutter/foundation.dart';

class ChatController extends ChangeNotifier {
  ChatController();

  Future<void> loadChats() async {}
  Future<void> saveMessage(String message) async {}
  Future<void> clear() async {}
}
