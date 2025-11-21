import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:openai_dart/openai_dart.dart' as open_ai;
import '../config/private_keys.dart';

class AIController extends ChangeNotifier {
  static final notifier = ValueNotifier(AIController._());
  static AIController get instance => notifier.value;

  AIController._();

  bool busy = false;
  String model = "llama3-70b-8192";

  final String _apiKey = PrivateKeys.groqApiKey;
  final String _baseUrl = "https://api.groq.com/openai/v1";

  bool get canPrompt => !busy && _apiKey.isNotEmpty;

  static Map<String, String> getTypes(context) => {
        "groq": "Groq AI",
      };

  static Future<void> load([String? type]) async {}

  Future<void> save() async {}

  Stream<String> prompt() async* {
    busy = true;
    notifyListeners();

    final client = open_ai.OpenAIClient(
      apiKey: _apiKey,
      baseUrl: _baseUrl,
    );

    final stream = client.createChatCompletionStream(
      request: open_ai.CreateChatCompletionRequest(
        model: open_ai.ChatCompletionModel.modelId(model),
        messages: [
          {"role": "user", "content": "Привет"}
        ],
        stream: true,
      ),
    );

    try {
      await for (final chunk in stream) {
        if (chunk.choices?.isNotEmpty == true) {
          yield chunk.choices!.first.delta?.content ?? '';
        }
      }
    } finally {
      busy = false;
      notifyListeners();
    }
  }

  void clear() {}
}

/// ЗАГЛУШКИ чтобы UI не падал

class LlamaCppController extends ChangeNotifier {
  static LlamaCppController? instance;

  bool loading = false;
  String? model;
  List<String> modelOptions = [];

  void reloadModel([bool force = false]) {}
  void pickModel() {}
  void loadModelFile(String path, bool force) {}
}

class RemoteAIController {
  static RemoteAIController? instance;
  String? model;
  List<String> modelOptions = [];
  bool get canGetRemoteModels => false;
  Future<bool> getModelOptions() async => false;
}

class RemoteAIController extends ChangeNotifier {
  static RemoteAIController? instance = RemoteAIController();

  String? model;
  List<String> modelOptions = [];

  bool get canGetRemoteModels => false;

  Future<bool> getModelOptions() async => false;
}

class LlamaCppController extends ChangeNotifier {
  static LlamaCppController? instance = LlamaCppController();

  bool loading = false;
  String? model;
  List<String> modelOptions = [];

  void reloadModel([bool force = false]) {}
  void pickModel() {}
  void loadModelFile(String path, bool force) {}
}
