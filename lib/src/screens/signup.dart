import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/riverpods/auth_riverpods.dart';
import 'package:grnagain/src/widgets/index.dart';
import 'package:grnagain/src/widgets/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:grnagain/i18n/strings.g.dart';
import '../router/router.gr.dart';

class Signup extends ConsumerWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(t.register,
                          style: Styles.designText(
                              bold: true, color: Palette.primary, size: 30)),
                      Text(t.createAccount,
                          style: Styles.designText(
                              bold: false, color: Palette.primary, size: 15)),
                    ],
                  ),
                ),
                Image.asset('assets/images/leaf.png'),
              ],
            ),
            const SizedBox(height: 10),
            Input(
              controller: nameController,
              icon: LineIcons.lock,
              label: t.fullName,
              hint: t.fullName,
              validator: (data) {
                return data!.length >= 6 ? null : t.enterValidName;
              },
              isPassword: false,
            ),
            const SizedBox(height: 14),
            Input(
              controller: emailController,
              icon: LineIcons.lock,
              label: t.email,
              hint: t.enterEmail,
              validator: (data) {
                return data!.contains("@") ? null : t.enterValidEMail;
              },
              isPassword: false,
            ),
            const SizedBox(height: 22),
            Input(
              controller: passwordController,
              icon: Icons.email,
              label: t.password,
              hint: '*******',
              validator: (data) {
                return data!.length > 6 ? null : t.enterCorrectPassword;
              },
              isPassword: true,
            ),
            const SizedBox(height: 32),
            Button(
              callback: () async {
                if (formKey.currentState!.validate()) {
                  await EasyLoading.show(
                      status: t.signingUp,
                      maskType: EasyLoadingMaskType.black,
                      dismissOnTap: false);
                  final res = await ref.read(firebaseAuthRiverpod).signupUser(
                        mail: emailController.value.text,
                        pass: passwordController.value.text,
                        name: nameController.value.text,
                      );

                  if (res!.user != null) {
                    context.autorouter.popUntilRoot();
                    await FirebaseAuth.instance.currentUser?.reload();

                    await EasyLoading.showInfo("Authenticated successfully");
                    context.autorouter.popUntilRoot();
                    context.autorouter.push(const Home());
                  } else {
                    await EasyLoading.dismiss();
                    await EasyLoading.showError(t.error);
                  }
                }
              },
              isLoading: false,
              label: t.singup,
            ),
            const SizedBox(height: 30),
            Text(t.orSignInWith,
                style: Styles.designText(
                    bold: true, color: Palette.primary, size: 16)),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  callback: () async {
                    context.autorouter.popUntilRoot();
                    ref.read(googleSignUpRiverpod);
                    ref.refresh(authStateRiverpod);

                    context.autorouter.push(const Home());
                  },
                  iconAsset: 'assets/images/google.png',
                ),
                const SizedBox(width: 18),
                SocialButton(
                  callback: () {},
                  iconAsset: 'assets/images/facebook.png',
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(t.alreadyHaveAccount,
                    style: Styles.designText(
                        bold: false, color: Palette.dark, size: 12)),
                const SizedBox(width: 7),
                TextButton(
                  onPressed: () => context.autorouter.replaceNamed('/login'),
                  child: Text(t.login,
                      style: Styles.designText(
                          bold: true, color: Palette.primary, size: 14)),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
