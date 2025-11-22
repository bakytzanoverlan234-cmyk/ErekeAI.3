import 'package:flutter/material.dart';
import 'package:maid/controllers/app_settings.dart';

class SystemSettings extends StatefulWidget {
  const SystemSettings({super.key});

  @override
  State<SystemSettings> createState() => _SystemSettingsState();
}

class _SystemSettingsState extends State<SystemSettings> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: AppSettings.instance.systemPrompt,
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
        const Text('Системный промпт'),
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          maxLines: 5,
          onChanged: settings.setSystemPrompt,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
