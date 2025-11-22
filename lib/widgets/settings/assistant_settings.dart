import 'package:flutter/material.dart';
import 'package:maid/controllers/app_settings.dart';

class AssistantSettings extends StatefulWidget {
  const AssistantSettings({super.key});

  @override
  State<AssistantSettings> createState() => _AssistantSettingsState();
}

class _AssistantSettingsState extends State<AssistantSettings> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: AppSettings.instance.assistantName ?? '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = AppSettings.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Имя ассистента'),
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          onChanged: settings.setAssistantName,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
