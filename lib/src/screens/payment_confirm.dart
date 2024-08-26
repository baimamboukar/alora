// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/widgets/index.dart';

@RoutePage()
class PaymentConfirmPage extends ConsumerStatefulWidget {
  const PaymentConfirmPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentConfirmState();
}

class _PaymentConfirmState extends ConsumerState<PaymentConfirmPage> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser?.updateDisplayName(
      "${FirebaseAuth.instance.currentUser?.displayName} - prenium",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle,
                color: context.colorScheme.primary, size: 100),
            Text(
              t.paymentConfirmation,
              style: Styles.designText(
                  bold: true, size: 18, color: context.colorScheme.primary),
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              t.paidSuccess,
              style:
                  Styles.designText(size: 14, color: Palette.dark, bold: false),
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              t.changesApply,
              style:
                  Styles.designText(size: 10, color: Palette.dark, bold: false),
            ),
            const SizedBox(
              height: 22,
            ),
            Button(
              callback: () {
                FirebaseAuth.instance.currentUser?.reload();
                exit(0);
              },
              isLoading: false,
              label: t.restartApp,
            )
          ],
        ),
      )),
    );
  }
}
