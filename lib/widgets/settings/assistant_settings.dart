import 'package:flutter/material.dart';

class AssistantSettings extends StatelessWidget {
  const AssistantSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('Ассистент'),
      subtitle: Text('Ассистент ErekeAI настроен по умолчанию (Groq).'),
    );
  }
}
