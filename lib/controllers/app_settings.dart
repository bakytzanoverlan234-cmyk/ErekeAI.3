import 'package:flutter/foundation.dart';
import 'dart:typed_data';

class AppSettings extends ChangeNotifier {
  static final AppSettings instance = AppSettings._internal();
  AppSettings._internal();

  // === ПОЛЬЗОВАТЕЛЬ ===
  String? userName;
  Uint8List? userImage;

  void setUserName(String value) {
    userName = value;
    notifyListeners();
  }

  // === АССИСТЕНТ ===
  String? assistantName;
  Uint8List? assistantImage;

  void setAssistantName(String value) {
    assistantName = value;
    notifyListeners();
  }

  Future<void> loadUserImage() async {}
  Future<void> loadAssistantImage() async {}

  // === СИСТЕМНЫЕ ===
  String systemPrompt = '';
  Color seedColor = const Color(0xFF6750A4);

  void setSystemPrompt(String value) {
    systemPrompt = value;
    notifyListeners();
  }

  Future<void> load() async {}
  Future<void> save() async {}
}
