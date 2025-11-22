import 'package:flutter/material.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('Пользователь'),
      subtitle: Text('Профиль пользователя в этой сборке ErekeAI не настраивается.'),
    );
  }
}
