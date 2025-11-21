import 'package:flutter/material.dart';

class RemoteModelDropdown extends StatelessWidget {
  const RemoteModelDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Model',
          border: OutlineInputBorder(),
        ),
        child: const Text('Groq only build'),
      ),
    );
  }
}
