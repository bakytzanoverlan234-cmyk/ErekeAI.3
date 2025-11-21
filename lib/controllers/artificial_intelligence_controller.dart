import 'package:flutter/foundation.dart';

class AIController extends ChangeNotifier {
  static final ValueNotifier<AIController> notifier = ValueNotifier(AIController._internal());
  static AIController get instance => notifier.value;

  AIController._internal();

  bool busy = false;
  String type = "groq";

  static Map<String, String> getTypes(context) => {"groq": "Groq AI"};

  static Future<void> load([String? type]) async {}
  Future<void> save() async {}

  String getTypeLocale(context) => "Groq AI";
}
