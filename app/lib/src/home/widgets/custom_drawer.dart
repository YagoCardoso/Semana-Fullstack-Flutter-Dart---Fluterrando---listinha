import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:listinha/src/shared/store/app_store.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.syncDate,
    );
    final syncDate = appStore.syncDate.value;
    var syncDateText = 'Nunca';

    if (syncDate != null) {
      final format = DateFormat('dd/MM/yyy às hh:mm');
      syncDateText = format.format(syncDate);
    }
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 1) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/config');
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
          child: Text(
            'Opções',
            style: textTheme.titleSmall,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: SizedBox(
            width: 210,
            child: Row(
              children: [
                const Text('Sincronizar'),
                const Spacer(),
                Text(
                  syncDateText,
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
      ],
    );
  }
}
