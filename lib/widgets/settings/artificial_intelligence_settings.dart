import 'package:flutter/material.dart';

class ArtificialIntelligenceSettings extends StatelessWidget {
  const ArtificialIntelligenceSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('AI настройки'),
      subtitle: Text('ErekeAI использует Groq (llama3-70b-8192). Другие провайдеры отключены.'),
    );
  }
}
