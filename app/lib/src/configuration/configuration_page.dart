import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/widgets/custom_app_bar_widget.dart';

import '../shared/store/app_store.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(
        titleContent: 'Configurações',
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Tema',
              style: textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: appStore.themeMode.value,
              title: const Text('Sistema'),
              onChanged: appStore.changeThemeMode,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: appStore.themeMode.value,
              title: const Text('Claro'),
              onChanged: appStore.changeThemeMode,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: appStore.themeMode.value,
              title: const Text('Escuro'),
              onChanged: appStore.changeThemeMode,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Controle de dados',
              style: textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Apagar cache e reiniciar o app',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
