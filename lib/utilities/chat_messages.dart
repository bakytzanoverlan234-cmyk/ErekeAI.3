class ChatMessage {
  final String id;
  ChatMessage(this.id);

  List<ChatMessage> get children => [];
  ChatMessage? get parent => null;

  ChatMessage? currentChild;
}
