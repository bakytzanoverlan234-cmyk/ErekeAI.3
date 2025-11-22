import 'package:flutter/material.dart';
import 'package:maid/controllers/artificial_intelligence_controller.dart';

class PromptField extends StatefulWidget {
  const PromptField({super.key});

  @override
  State<PromptField> createState() => PromptFieldState();
}

class PromptFieldState extends State<PromptField> {
  final TextEditingController controller = TextEditingController();

  void onSubmit() {
    if (controller.text.trim().isEmpty) return;
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final isNotEmpty = controller.text.trim().isNotEmpty;

    return Column(
      children: [
        TextField(
          controller: controller,
          maxLines: null,
          decoration: const InputDecoration(
            hintText: 'Введите сообщение...',
            border: OutlineInputBorder(),
          ),
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: isNotEmpty && AIController.instance.canPrompt ? onSubmit : null,
                child: AIController.instance.busy
                    ? const Text('Обработка...')
                    : const Text('Отправить'),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: AIController.instance.stop,
              child: const Text('Стоп'),
            )
          ],
        )
      ],
    );
  }
}
