import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/extensions.dart';

@RoutePage()
class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () => context.autorouter.maybePop(),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xFFEAEAEA),
                  child: Center(
                    child: Icon(
                      Icons.chevron_left,
                      size: 32,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Text("Notificaions",
                    style: Styles.designText(
                        bold: true,
                        color: context.colorScheme.primary,
                        size: 26)),
              ),
              Positioned(right: 0, child: Image.asset("assets/images/leaf.png"))
            ],
          ),
          const SizedBox(
            height: 120,
          ),
          Icon(Icons.notifications_active,
              size: 100, color: context.colorScheme.primary)
        ],
      ),
    );
  }
}
