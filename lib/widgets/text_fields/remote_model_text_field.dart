import 'package:flutter/material.dart';

class RemoteModelTextField extends StatelessWidget {
  const RemoteModelTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      decoration: const InputDecoration(
        labelText: 'Model',
        hintText: 'Groq only build',
        border: OutlineInputBorder(),
      ),
    );
  }
}
