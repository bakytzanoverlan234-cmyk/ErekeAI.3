import 'dart:typed_data';
import 'package:flutter/foundation.dart';

class AppSettings extends ChangeNotifier {
  static final AppSettings instance = AppSettings._internal();
  AppSettings._internal();

  dynamic user;          // заглушка под старое поле
  Uint8List? userImage;  // чтобы не падало на userImage

  Future<void> load() async {
    // тут можно потом добавить загрузку настроек
  }

  Future<void> save() async {
    // тут можно потом добавить сохранение настроек
  }
}
