import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/i18n/strings.g.dart';
class Settings extends ConsumerStatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
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
