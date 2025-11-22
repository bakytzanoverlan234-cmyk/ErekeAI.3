import 'package:flutter/foundation.dart';

class AIController extends ChangeNotifier {
  static final AIController instance = AIController._internal();
  AIController._internal();

  bool busy = false;

  bool get canPrompt => !busy;

  void clear() {
    debugPrint("AIController.clear() invoked (stub)");
  }

  void stop() {
    busy = false;
    notifyListeners();
  }
}
