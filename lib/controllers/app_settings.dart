import 'dart:typed_data';
import 'package:flutter/material.dart';

class AppSettings extends ChangeNotifier {
  static final AppSettings instance = AppSettings._internal();
  AppSettings._internal();

  // Пользователь
  String? userName;
  Uint8List? userImage;

  // Ассистент
  Uint8List? assistantImage;
  String systemPrompt = "You are a helpful AI assistant.";

  // Тема
  Color seedColor = Colors.blue;

  // ===== Методы =====

  Future<void> load() async {}

  Future<void> save() async {}

  void setUserName(String? name) {
    userName = name;
    notifyListeners();
  }

  void setSystemPrompt(String value) {
    systemPrompt = value;
    notifyListeners();
  }

  Future<void> loadUserImage() async {
    // Заглушка под кнопку выбора изображения пользователя
  }

  void setUserImage(Uint8List? image) {
    userImage = image;
    notifyListeners();
  }

  void setAssistantImage(Uint8List? image) {
    assistantImage = image;
    notifyListeners();
  }
}
