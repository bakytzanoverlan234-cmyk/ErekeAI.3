import 'package:flutter/material.dart';
import 'package:maid/locale/app_localizations.dart';

/// Простой дропдаун-заглушка для удалённых моделей (мы используем только Groq)
class RemoteModelDropdown extends StatelessWidget {
  const RemoteModelDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return IgnorePointer(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: loc?.model ?? 'Model',
          border: const OutlineInputBorder(),
        ),
        child: Text(
          loc?.noModelSelected ?? 'Groq only build',
        ),
      ),
    );
  }
}
