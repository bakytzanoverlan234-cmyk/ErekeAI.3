import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:openai_dart/openai_dart.dart' as open_ai;
import '../config/private_keys.dart';

class GroqAIController extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  String? _model;
  String? _apiKey;
  String? _baseUrl;

  List<String> _modelOptions = [];

  GroqAIController() {
    _apiKey = PrivateKeys.groqApiKey;
    _baseUrl = "https://api.groq.com/openai/v1";
  }

  bool get canPrompt =>
      _apiKey != null && _apiKey!.isNotEmpty && _model != null && !busy;

  Stream<String> prompt(List<Map<String, String>> messages) async* {
    if (!canPrompt) return;

    _busy = true;
    notifyListeners();

    final client = open_ai.OpenAIClient(
      apiKey: _apiKey!,
      baseUrl: _baseUrl!,
    );

    final stream = client.createChatCompletionStream(
      request: open_ai.CreateChatCompletionRequest(
        model: open_ai.ChatCompletionModel.modelId(_model!),
        messages: messages,
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
      _busy = false;
      notifyListeners();
    }
  }

  Future<void> loadModels() async {
    final client = open_ai.OpenAIClient(
      apiKey: _apiKey!,
      baseUrl: _baseUrl!,
    );

    final models = await client.listModels();
    _modelOptions = models.data.map((m) => m.id).toList();
  }

  List<String> get modelOptions => _modelOptions;

  void setModel(String model) {
    _model = model;
    notifyListeners();
  }
}
