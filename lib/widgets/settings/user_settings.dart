import 'package:flutter/material.dart';
import 'package:maid/controllers/app_settings.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: AppSettings.instance.userName ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = AppSettings.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Имя пользователя'),
        const SizedBox(height: 8),
        TextField(
          controller: _nameController,
          onChanged: settings.setUserName,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
