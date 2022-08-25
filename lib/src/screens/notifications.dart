import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Notifications extends ConsumerWidget {
  const Notifications({Key? key}) : super(key: key);

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
                onTap: () => context.autorouter.pop(),
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFEAEAEA),
                  child: Center(
                    child: Icon(
                      Icons.chevron_left,
                      size: 32,
                      color: Palette.primary,
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
                        bold: true, color: Palette.primary, size: 26)),
              ),
              Positioned(right: 0, child: Image.asset("assets/images/leaf.png"))
            ],
          ),
          const SizedBox(
            height: 120,
          ),
          const Icon(Icons.notifications_active,
              size: 100, color: Palette.primary)
        ],
      ),
    );
  }
}
