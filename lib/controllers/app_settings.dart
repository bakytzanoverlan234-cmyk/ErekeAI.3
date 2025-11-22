import 'package:flutter/material.dart';

class AppSettings {
  static final AppSettings instance = AppSettings._internal();
  AppSettings._internal();

  String assistantName = "Ассистент";
  String userName = "Пользователь";
  String systemPrompt = "Ты полезный ассистент";

  Color seedColor = const Color(0xFF6750A4);

  String? assistantImage;
  String? userImage;

  void setAssistantName(String value) {
    assistantName = value;
  }

  void setUserName(String value) {
    userName = value;
  }

  void setSystemPrompt(String value) {
    systemPrompt = value;
  }
}
