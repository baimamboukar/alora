import 'package:alora/src/configs/index.dart';
import 'package:alora/src/extensions/extensions.dart';
import 'package:alora/src/riverpods/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
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
                  child: Text(context.loc.settings,
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
              leading: const CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage("assets/images/user.png"),
              ),
              title: Text("Alora booster",
                  style: Styles.designText(
                      bold: true, color: Palette.primary, size: 18)),
              subtitle: Text("aloraboss@alorabiz.cm",
                  style: Styles.designText(
                      bold: false, color: Palette.primary, size: 12)),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(
                LineIcons.language,
                color: Palette.primary,
                size: 32,
              ),
              title: Text("Language",
                  style: Styles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            ),
            ListTile(
              leading: const Icon(
                Icons.people,
                color: Palette.primary,
                size: 32,
              ),
              title: Text("Contact us",
                  style: Styles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            ),
            ListTile(
              leading: const Icon(
                Icons.fiber_manual_record,
                color: Palette.primary,
                size: 32,
              ),
              title: Text("Terms & Conditions",
                  style: Styles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            ),
            ListTile(
              leading: const Icon(
                Icons.help_center_rounded,
                color: Palette.primary,
                size: 32,
              ),
              title: Text("Help center",
                  style: Styles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            ),
            ListTile(
              onTap: () async {
                EasyLoading.show(status: "Logging out..", dismissOnTap: false);
                ref
                    .read(firebaseAuthRiverpod)
                    .logoutUser()
                    .then((res) => context.autorouter.popUntilRoot());
                EasyLoading.dismiss();
              },
              leading: const Icon(
                LineIcons.powerOff,
                color: Palette.primary,
                size: 32,
              ),
              title: Text("Logout",
                  style: Styles.designText(
                      bold: false, color: Palette.primary, size: 16)),
            )
          ],
        ),
      ),
    );
  }
}
