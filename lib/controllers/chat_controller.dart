class ChatController {
  static final ChatController instance = ChatController._internal();
  ChatController._internal();

  void clear() {
    print("ChatController.clear() called (stub)");
  }
}
