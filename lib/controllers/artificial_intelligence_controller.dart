import 'dart:async';
import 'package:flutter/foundation.dart';

class AIController extends ChangeNotifier {
  static final ValueNotifier<AIController> notifier =
      ValueNotifier(AIController._internal());
  static AIController get instance => notifier.value;

  AIController._internal();

  bool busy = false;

  String model = "llama3-70b-8192";
  String type = "groq";

  Map<String, dynamic> parameters = {};

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

  Stream<String> prompt() async* {
    busy = true;
    notifyListeners();

    yield "Groq подключён";

    busy = false;
    notifyListeners();
  }

  void clear() {}
}

/// ✅ Заглушка RemoteAIController под UI
class RemoteAIController extends ChangeNotifier {
  static RemoteAIController? instance = RemoteAIController();

  String apiKey = "";
  String baseUrl = "";

  String? model;
  List<String> modelOptions = [];

  bool get canGetRemoteModels => false;

  Future<bool> getModelOptions() async => false;
}

/// ✅ Заглушка LlamaCppController под UI
class LlamaCppController extends ChangeNotifier {
  static LlamaCppController? instance = LlamaCppController();

  bool loading = false;
  String? model;
  List<String> modelOptions = [];

  void reloadModel([bool force = false]) {}
  void pickModel() {}
  void loadModelFile(String path, bool force) {}
}

/// ✅ Заглушка OllamaController для UI
class OllamaController extends ChangeNotifier {
  static OllamaController? instance = OllamaController();

  bool searchLocalNetwork = false;

  void toggleSearch(bool value) {
    searchLocalNetwork = value;
    notifyListeners();
  }
}
