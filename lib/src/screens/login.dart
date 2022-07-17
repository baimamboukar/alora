import 'package:alora/src/configs/index.dart';
import 'package:alora/src/extensions/extensions.dart';
import 'package:alora/src/riverpods/auth_riverpods.dart';
import 'package:alora/src/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

final formKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class Login extends ConsumerWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                    controller: emailController,
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
                    controller: passwordController,
                    icon: Icons.email,
                    label: context.loc.password,
                    hint: '••••••••',
                    validator: (data) {
                      return data!.length > 5
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
                    callback: () async {
                      if (formKey.currentState!.validate()) {
                        await EasyLoading.show(
                            status: "login...",
                            maskType: EasyLoadingMaskType.black,
                            dismissOnTap: false);
                        ref
                            .read(firebaseAuthRiverpod)
                            .loginUser(
                              mail: emailController.value.text,
                              pass: passwordController.value.text,
                            )
                            .then((res) async {
                          context.autorouter.popUntilRoot();
                          if (res.user != null) {
                            ref.refresh(firebaseAuthRiverpod);
                            await EasyLoading.dismiss();
                            await EasyLoading.showSuccess(
                                "Authenticated successfully");
                            context.autorouter.popUntilRoot();
                          } else {
                            await EasyLoading.dismiss();
                            await EasyLoading.showError(
                                "Something went wrong, please try again later");
                          }
                        });
                      }
                    },
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
      ),
    );
  }
}
