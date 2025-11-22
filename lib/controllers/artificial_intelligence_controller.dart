import 'dart:async';
import 'package:flutter/foundation.dart';

class AIController extends ChangeNotifier {
  static final ValueNotifier<AIController> notifier = ValueNotifier(AIController._internal());
  static AIController get instance => notifier.value;

  AIController._internal();

  bool busy = false;

  String model = "llama3-70b-8192";
  Map<String, dynamic> parameters = {};

  String type = "groq";

  bool get canPrompt => !busy;

  void stop() {
    busy = false;
    notifyListeners();
  }

  static Map<String, String> getTypes(context) {
    return {"groq": "Groq AI"};
  }

  static Future<void> load([String? type]) async {}

  Future<void> save() async {}

  Stream<String> prompt() async* {}

  void clear() {}
}

/// ✅ ПОЛНАЯ заглушка RemoteAIController под ожидания UI
class RemoteAIController extends ChangeNotifier {
  static RemoteAIController? instance = RemoteAIController();

  String apiKey = "";
  String baseUrl = "";

  String? model;
  List<String> modelOptions = [];

  bool get canGetRemoteModels => false;

  Future<bool> getModelOptions() async => false;
}

/// ✅ Полная заглушка LlamaCppController
class LlamaCppController extends ChangeNotifier {
  static LlamaCppController? instance = LlamaCppController();

  bool loading = false;
  String? model;
  List<String> modelOptions = [];

  void reloadModel([bool force = false]) {}
  void pickModel() {}
  void loadModelFile(String path, bool force) {}
}
