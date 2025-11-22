import 'package:flutter/foundation.dart';

class AppSettings extends ChangeNotifier {
  static final AppSettings instance = AppSettings._internal();
  AppSettings._internal();

  // Заглушки, чтобы не падал старый код
  String? userName;
  String? assistantName;
  String systemPrompt = '';

  Future<void> load() async {}
  Future<void> save() async {}

  void setUserName(String value) {
    userName = value;
    notifyListeners();
  }

  void setAssistantName(String value) {
    assistantName = value;
    notifyListeners();
  }

  void setSystemPrompt(String value) {
    systemPrompt = value;
    notifyListeners();
  }

  Future<void> loadUserImage() async {}
  Future<void> loadAssistantImage() async {}
}
