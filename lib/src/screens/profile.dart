import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/riverpods/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
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
                  child: Text(t.profile,
                      style: Styles.designText(
                          bold: true, color: Palette.primary, size: 26)),
                ),
                Positioned(
                    right: 0, child: Image.asset("assets/images/leaf.png"))
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
                  radius: 32,
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
                            ?.split('-')[0]
                            .substring(0, 12) ??
                        "User",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.designText(
                        bold: true, color: Palette.primary, size: 14),
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
                          child: const Icon(
                            Icons.verified,
                            color: Palette.primary,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              subtitle: Text(FirebaseAuth.instance.currentUser?.email ?? "...",
                  style: Styles.designText(
                      bold: false, color: Palette.primary, size: 12)),
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
                                    color: Palette.primary),
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
              leading: const Icon(
                Icons.language,
                color: Palette.primary,
                size: 32,
              ),
              subtitle: Text(t.changeAppLanguage,
                  style: Styles.designText(
                      bold: false, color: Palette.secondary, size: 11)),
              title: Text(t.language,
                  style: Styles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            ),
            ListTile(
              leading: const Icon(
                Icons.light_mode,
                color: Palette.primary,
                size: 32,
              ),
              trailing: ValueListenableBuilder(
                valueListenable: Hive.box('settings').listenable(),
                builder: (BuildContext context, Box box, Widget? widget) {
                  return CupertinoSwitch(
                    activeColor: Palette.primary,
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
                      bold: false, color: Palette.primary, size: 16)),
            ),
            ListTile(
              leading: const Icon(
                Icons.people,
                color: Palette.primary,
                size: 32,
              ),
              title: Text(t.contactUS,
                  style: Styles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            ),
            ListTile(
              leading: const Icon(
                Icons.fiber_manual_record,
                color: Palette.primary,
                size: 32,
              ),
              title: Text(t.termsOfService,
                  style: Styles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            ),
            ListTile(
              leading: const Icon(
                Icons.help_center_rounded,
                color: Palette.primary,
                size: 32,
              ),
              title: Text(t.helpCenter,
                  style: Styles.designText(
                      bold: false, color: Palette.primary, size: 16)),
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
              leading: const Icon(
                LineIcons.powerOff,
                color: Palette.primary,
                size: 32,
              ),
              title: Text(t.logout,
                  style: Styles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            )
          ],
        ),
      ),
    );
  }
}
