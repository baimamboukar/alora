// ignore_for_file: avoid_unnecessary_containers

import 'package:alora/src/configs/index.dart';
import 'package:alora/src/extensions/extensions.dart';
import 'package:alora/src/widgets/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentConfirm extends ConsumerStatefulWidget {
  const PaymentConfirm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentConfirmState();
}

class _PaymentConfirmState extends ConsumerState<PaymentConfirm> {
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
            const Icon(Icons.check_circle, color: Palette.primary, size: 100),
            Text(
              "Payment Confirmation",
              style: Styles.designText(
                  bold: true, size: 18, color: Palette.primary),
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              "You have successfully paid for your order",
              style:
                  Styles.designText(size: 14, color: Palette.dark, bold: false),
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              "In order to apply changes in the app, go back to the home screen",
              style:
                  Styles.designText(size: 10, color: Palette.dark, bold: false),
            ),
            const SizedBox(
              height: 22,
            ),
            Button(
              callback: () {
                FirebaseAuth.instance.currentUser?.reload();
                context.autorouter.popUntilRoot();
              },
              isLoading: false,
              label: "Go back Home",
            )
          ],
        ),
      )),
    );
  }
}
