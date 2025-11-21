import 'package:flutter/foundation.dart';
import '../utilities/chat_messages.dart';

class ChatController extends ChangeNotifier {
  static final ChatController instance = ChatController._internal();
  ChatController._internal();

  ChatMessage? root;
  Map<String, ChatMessage> mapping = {};
  List<String> roots = [];

  void addMessage(ChatMessage msg) {}
  void deleteMessage(ChatMessage msg) {}
  void deleteChat(ChatMessage msg) {}
  void exportChat(ChatMessage msg) {}
  void importChat() {}
  void newChat() {}
  void clear() {}

  Future<void> loadChats() async {}
  Future<void> saveMessage(String message) async {}
}
