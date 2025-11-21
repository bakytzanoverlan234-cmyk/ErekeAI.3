import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:openai_dart/openai_dart.dart' as open_ai;
import '../config/private_keys.dart';

class GroqAIController extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  String? _model = "llama3-70b-8192";
  final String _baseUrl = "https://api.groq.com/openai/v1";
  final String _apiKey = PrivateKeys.groqApiKey;

  bool get canPrompt => _apiKey.isNotEmpty && _model != null && !_busy;

  Stream<String> prompt(List<Map<String, String>> messages) async* {
    if (!canPrompt) return;

    _busy = true;
    notifyListeners();

    final client = open_ai.OpenAIClient(
      apiKey: _apiKey,
      baseUrl: _baseUrl,
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
}
