import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/riverpods/index.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_icons/line_icons.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    backgroundColor: context.colorScheme.surface,
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
                  child: Text(t.profile,
                      style: Styles.designText(
                          bold: true,
                          color: context.colorScheme.primary,
                          size: 26)),
                ),
                Positioned(
                  right: 0,
                  child: Image.asset("assets/images/leaf.png"),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Visibility(
                visible: FirebaseAuth
                        .instance.currentUser?.providerData.first.photoURL !=
                    null,
                replacement: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 14,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 32,
                  backgroundImage: NetworkImage(FirebaseAuth
                          .instance.currentUser?.providerData.first.photoURL ??
                      ''),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    FirebaseAuth.instance.currentUser?.displayName
                            ?.split('-')[0] ??
                        "User",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.designText(
                        bold: true,
                        color: context.colorScheme.primary,
                        size: 14),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FirebaseAuth.instance.currentUser?.displayName
                              ?.endsWith('- prenium') ??
                          false
                      ? GestureDetector(
                          onTap: () {
                            FirebaseAuth.instance.currentUser?.updateDisplayName(
                                "${FirebaseAuth.instance.currentUser?.displayName?.split('-')[0].trimRight()}");
                          },
                          child: Icon(
                            Icons.verified,
                            color: context.colorScheme.primary,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              subtitle: Text(FirebaseAuth.instance.currentUser?.email ?? "...",
                  style: Styles.designText(
                      bold: false,
                      color: context.colorScheme.primary,
                      size: 12)),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              style: ListTileStyle.drawer,
              dense: false,
              trailing: ValueListenableBuilder(
                valueListenable: Hive.box('settings').listenable(),
                builder: (BuildContext context, Box box, Widget? widget) {
                  return DropdownButton<String>(
                    underline: const SizedBox.shrink(),
                    elevation: 0,
                    items: ["English", "French", "Deutsch"]
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: Styles.designText(
                                    size: 14.0,
                                    bold: false,
                                    color: context.colorScheme.primary),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      switch (value) {
                        case "Deutsch":
                          LocaleSettings.setLocale(AppLocale.de);
                          box.put('language', value);
                          setState(() {});
                          break;
                        case "French":
                          LocaleSettings.setLocale(AppLocale.fr);
                          box.put('language', value);
                          setState(() {});
                          break;
                        case "English":
                          LocaleSettings.setLocale(AppLocale.en);
                          box.put('language', value);
                          setState(() {});
                          break;
                        default:
                          LocaleSettings.setLocale(AppLocale.en);
                      }
                    },
                    value: box.get('language'),
                  );
                },
              ),
              leading: Icon(
                Icons.language,
                color: context.colorScheme.primary,
                size: 32,
              ),
              subtitle: Text(t.changeAppLanguage,
                  style: Styles.designText(
                      bold: false, color: Palette.secondary, size: 11)),
              title: Text(t.language,
                  style: Styles.designText(
                      bold: false,
                      color: context.colorScheme.primary,
                      size: 16)),
            ),
            ListTile(
              leading: Icon(
                Icons.light_mode,
                color: context.colorScheme.primary,
                size: 32,
              ),
              trailing: ValueListenableBuilder(
                valueListenable: Hive.box('settings').listenable(),
                builder: (BuildContext context, Box box, Widget? widget) {
                  return CupertinoSwitch(
                    activeColor: context.colorScheme.primary,
                    value: box.get('theme'),
                    onChanged: (value) {
                      box.put('theme', value);
                    },
                  );
                },
              ),
              subtitle: Text(t.changeAppTheme,
                  style: Styles.designText(
                      bold: false, color: Palette.secondary, size: 11)),
              title: Text(t.themeMode,
                  style: Styles.designText(
                      bold: false,
                      color: context.colorScheme.primary,
                      size: 16)),
            ),
            ListTile(
              onTap: () => context.autorouter.pushNamed('/bookmarks'),
              leading: Icon(
                LineIcons.heart,
                color: context.colorScheme.primary,
                size: 32,
              ),
              title: Text(
                t.bookmarks,
                style: Styles.designText(
                    bold: false, color: context.colorScheme.primary, size: 16),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: context.colorScheme.primary,
                size: 32,
              ),
              title: Text(t.contactUS,
                  style: Styles.designText(
                      bold: false,
                      color: context.colorScheme.primary,
                      size: 16)),
            ),
            ListTile(
              leading: Icon(
                Icons.fiber_manual_record,
                color: context.colorScheme.primary,
                size: 32,
              ),
              title: Text(t.termsOfService,
                  style: Styles.designText(
                      bold: false,
                      color: context.colorScheme.primary,
                      size: 16)),
            ),
            ListTile(
              leading: Icon(
                Icons.help_center_rounded,
                color: context.colorScheme.primary,
                size: 32,
              ),
              title: Text(t.helpCenter,
                  style: Styles.designText(
                      bold: false,
                      color: context.colorScheme.primary,
                      size: 16)),
            ),
            // About Page
            ListTile(
              onTap: () async {
                context.autorouter.pushNamed('/about');
              },
              leading: Icon(
                LineIcons.infoCircle,
                color: context.colorScheme.primary,
                size: 32,
              ),
              title: Text(
                "About GreenAgain",
                style: Styles.designText(
                    bold: false, color: context.colorScheme.primary, size: 16),
              ),
            ),
            ListTile(
              onTap: () async {
                await EasyLoading.show(
                    status: t.logginOUt, dismissOnTap: false);
                ref.read(firebaseAuthRiverpod).logoutUser().then((done) async {
                  context.autorouter.popUntilRoot();
                  await EasyLoading.dismiss();
                  await EasyLoading.showSuccess(t.loggedOut);
                });
              },
              leading: Icon(
                LineIcons.powerOff,
                color: context.colorScheme.primary,
                size: 32,
              ),
              title: Text(t.logout,
                  style: Styles.designText(
                      bold: false,
                      color: context.colorScheme.primary,
                      size: 16)),
            )
          ],
        ),
      ),
    );
  }
}
