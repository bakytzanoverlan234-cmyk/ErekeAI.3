import 'package:flutter/material.dart';

class SystemSettings extends StatelessWidget {
  const SystemSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('Системные настройки'),
      subtitle: Text('Глобальные параметры системы зафиксированы в этой сборке.'),
    );
  }
}
