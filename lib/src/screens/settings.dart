import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/widgets/index.dart';

@RoutePage()
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Button(
            isLoading: false,
            label: t.login,
            callback: () => context.autorouter.pushNamed('/login'),
          ),
          const SizedBox(height: 14),
          Button(
            isLoading: false,
            label: t.singup,
            callback: () => context.autorouter.pushNamed('/signup'),
          ),
          const SizedBox(height: 14),
          Button(
            isLoading: false,
            label: t.profile,
            callback: () => context.autorouter.pushNamed('/profile'),
          ),
        ],
      ),
    );
  }
}
