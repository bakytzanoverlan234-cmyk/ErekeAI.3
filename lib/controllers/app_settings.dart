import 'dart:typed_data';
import 'package:flutter/foundation.dart';

class AppSettings extends ChangeNotifier {
  static final AppSettings instance = AppSettings._internal();
  AppSettings._internal();

  String? userName;
  Uint8List? userImage;

  Future<void> load() async {
    // Тут можно потом добавить загрузку настроек из SharedPreferences/файла
  }

  Future<void> save() async {
    // Тут можно потом добавить сохранение настроек
  }

  void setUserName(String? name) {
    userName = name;
    notifyListeners();
  }

  void setUserImage(Uint8List? image) {
    userImage = image;
    notifyListeners();
  }
}
