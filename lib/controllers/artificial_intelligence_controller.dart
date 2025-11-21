import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:openai_dart/openai_dart.dart' as open_ai;
import '../config/private_keys_local.dart';

/// ЕДИНЫЙ AI КОНТРОЛЛЕР ПОД GROQ, СОВМЕСТИМЫЙ СО СТАРЫМ UI

class AIController extends ChangeNotifier {
  static final ValueNotifier<AIController> notifier = ValueNotifier(AIController._internal());
  static AIController get instance => notifier.value;

  AIController._internal();

  bool busy = false;

  String model = "llama3-70b-8192";
  Map<String, dynamic> parameters = {};

  final String _baseUrl = "https://api.groq.com/openai/v1";
  final String _apiKey = PrivateKeyslocal.groqApiKey;

  bool get canPrompt => !busy && _apiKey.isNotEmpty;

  static Map<String, String> getTypes(context) {
    return {"groq": "Groq AI"};
  }

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

/// Заглушки для старых классов чтобы UI не падал

class LlamaCppController {
  static LlamaCppController? instance;
  String? model;
  void reloadModel([bool force = false]) {}
}

class RemoteAIController {
  static RemoteAIController? instance;
  String? model;
  List<String> modelOptions = [];
  bool get canGetRemoteModels => false;
  Future<bool> getModelOptions() async => false;
}
