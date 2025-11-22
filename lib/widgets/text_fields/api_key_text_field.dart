import 'package:flutter/widgets.dart';

class ApiKeyTextField extends StatelessWidget {
  const ApiKeyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    // Ключ теперь зашит локально, поле в UI не нужно
    return const SizedBox.shrink();
  }
}
