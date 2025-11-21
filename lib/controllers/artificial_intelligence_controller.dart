import "groq_ai_controller.dart";
part of 'package:maid/main.dart';

import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../config/private_keys.dart';


class GroqAIController extends ChangeNotifier {
  bool _busy = false;
  String? _model;
  Map<String, dynamic> _parameters = {};

  bool get busy => _busy;
  String? get model => _model;

  set model(String? value) {
    _model = value;
    notifyListeners();
  }

  GroqAIController() {
    _configure();
  }

  void _configure() {
      apiKey: PrivateKeys.groqApiKey,
      baseUrl: "https://api.groq.com/openai/v1",
    );
  }

  bool get canPrompt => _model != null && _model!.isNotEmpty && !_busy;

  Stream<String> prompt(List<Map<String, dynamic>> messages) async* {
    if (!canPrompt) {
      yield "Модель не выбрана или API не настроен";
      return;
    }

    _busy = true;
    notifyListeners();

    final stream = _openAiClient.createChatCompletionStream(
        messages: messages,
        stream: true,
        temperature: _parameters['temperature'] ?? 0.7,
        maxTokens: _parameters['max_tokens'] ?? 1024,
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

  Future<List<String>> getModels() async {
    final response = await _openAiClient.listModels();
    return response.data.map((m) => m.id).toList();
  }
}
