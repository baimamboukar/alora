import 'package:grnagain/src/configs/data.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/router/router.gr.dart';
import 'package:grnagain/src/services/auth/firebase_auth.dart';
import 'package:grnagain/src/services/mobile/image_picker_services.dart';
import 'package:grnagain/src/widgets/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'library_search_delegate.dart';

class CropsView extends ConsumerStatefulWidget {
  const CropsView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CropsViewState();
}

class _CropsViewState extends ConsumerState<CropsView> {
  @override
  Widget build(BuildContext context) {
    debugPrint(FirebaseAuth.instance.currentUser?.displayName);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
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
                    backgroundImage: NetworkImage(FirebaseAuth.instance
                            .currentUser?.providerData.first.photoURL ??
                        ''),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Palette.primary,
                  ),
                  onPressed: () =>
                      context.autorouter.pushNamed('/notifications'),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Text(context.loc.yourLibary,
                    style: Styles.designText(
                        bold: true, color: Palette.primary, size: 26)),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Container(
                    height: 58.0,
                    width: (context.screenWidth - 76) * .8,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Palette.light,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        onTap: () => showSearch(
                            context: context, delegate: CropsSearch()),
                        decoration: InputDecoration(
                          hintText: context.loc.searchLinary,
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Palette.secondary,
                          ),
                        ),
                      ),
                    )),
                const SizedBox(width: 22),
                GestureDetector(
                  onTap: () {
                    FirebaseAuthentication.isPreniumUser
                        ? showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return const ImagePickModal();
                            },
                          )
                        : context.autorouter.pushNamed('/purchase');
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Palette.primary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.document_scanner,
                      size: 28,
                      color: Palette.light,
                    )),
                  ),
                )
              ],
            ),
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 2,
                children: <Widget>[
                  ...crops.map(
                    (crop) => CropCaption(crop),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 28,
        backgroundColor: Palette.primary,
        child: IconButton(
            onPressed: () {
              FirebaseAuthentication.isPreniumUser
                  ? showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return const ImagePickModal();
                      },
                    )
                  : context.autorouter.pushNamed('/purchase');
            },
            icon: const Icon(
              Icons.document_scanner,
              color: Palette.light,
            )),
      ),
    );
  }
}

class ImagePickModal extends StatelessWidget {
  const ImagePickModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Palette.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            height: 6,
            width: 70,
            decoration: BoxDecoration(
              color: Palette.primary,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 20),
          Text("Pick image either from gallery or camera",
              style: Styles.designText(
                  bold: false, color: Palette.primary, size: 16)),
          Column(
            children: [
              Text(
                "Pick image from camera or gallery",
                style: Styles.designText(
                    color: Palette.light, size: 16, bold: true),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final XFile? image =
                          await ImagePickerServices.takeCameraImage();

                      if (image == null) {
                        EasyLoading.showError("No image selected");
                      } else {
                        context.autorouter.push(Predict(image: image));
                      }
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                          width: 100.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: Palette.primary,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              const Icon(LineIcons.camera,
                                  size: 32, color: Palette.secondary),
                              Text(
                                "Camera",
                                style: Styles.designText(
                                    color: Palette.light,
                                    size: 12,
                                    bold: false),
                              ),
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final XFile? image =
                          await ImagePickerServices.pickGalleryImage();
                      if (image == null) {
                        EasyLoading.showError("No image selected");
                      } else {
                        context.autorouter.push(Predict(image: image));
                      }
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                          width: 100.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: Palette.primary,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              const Icon(LineIcons.images,
                                  size: 32, color: Palette.secondary),
                              Text(
                                "Gallery",
                                style: Styles.designText(
                                    color: Palette.light,
                                    size: 12,
                                    bold: false),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
