import 'package:alora/src/configs/index.dart';
import 'package:alora/src/extensions/extensions.dart';
import 'package:alora/src/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class Login extends ConsumerWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/login_bg.png',
              fit: BoxFit.contain,
              width: context.screenWidth,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(children: [
                Text(context.loc.welcomeBack,
                    style: Styles.designText(
                        bold: true, color: Palette.primary, size: 30)),
                Text(context.loc.loginToAccount,
                    style: Styles.designText(
                        bold: false, color: Palette.primary, size: 20)),
                const SizedBox(height: 32),
                Input(
                  controller: TextEditingController(),
                  icon: LineIcons.lock,
                  label: context.loc.email,
                  hint: context.loc.enterEmail,
                  validator: (data) {
                    return null;
                  },
                  isPassword: false,
                ),
                const SizedBox(height: 22),
                Input(
                  controller: TextEditingController(),
                  icon: Icons.email,
                  label: context.loc.password,
                  hint: '••••••••',
                  validator: (data) {
                    return data!.length > 6
                        ? null
                        : context.loc.enterCorrectPassword;
                  },
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(context.loc.forgotPassword,
                        style: Styles.designText(
                            bold: true, color: Palette.primary, size: 16)),
                  ],
                ),
                const SizedBox(height: 24),
                Button(
                  callback: () {},
                  isLoading: false,
                  label: context.loc.login,
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(context.loc.dontHaveAccount,
                        style: Styles.designText(
                            bold: false, color: Palette.dark, size: 16)),
                    const SizedBox(width: 7),
                    TextButton(
                      onPressed: () =>
                          context.autorouter.replaceNamed('/signup'),
                      child: Text(context.loc.singup,
                          style: Styles.designText(
                              bold: true, color: Palette.primary, size: 16)),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
