import 'package:flutter/material.dart';
class PromptField extends StatelessWidget {
  const PromptField({super.key});
  @override
  Widget build(BuildContext context) {
    return const TextField(decoration: InputDecoration(hintText: "Сообщение"));
  }
}
