// ignore_for_file: avoid_unnecessary_containers, use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/router/router.gr.dart';
import 'package:grnagain/src/services/mobile/image_picker_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

class ImagePickModal extends StatelessWidget {
  final bool forSoilAnalysis;
  const ImagePickModal({
    super.key,
    this.forSoilAnalysis = false,
  });

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
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 20),
          Text(t.pickImageFromGallery,
              style: Styles.designText(
                  bold: false, color: context.colorScheme.primary, size: 16)),
          Column(
            children: [
              Text(
                t.pickImageFromGallery,
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
                        EasyLoading.showError(t.noIMageSelected);
                      } else {
                        context.router.push(
                          DiseaseDetailsRoute(image: image),
                        );
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
                            color: context.colorScheme.primary,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              const Icon(LineIcons.camera,
                                  size: 32, color: Palette.secondary),
                              Text(
                                t.camera,
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
                        EasyLoading.showError(t.noIMageSelected);
                      } else {
                        context.router.push(
                          DiseaseDetailsRoute(image: image),
                        );
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
                            color: context.colorScheme.primary,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              const Icon(LineIcons.images,
                                  size: 32, color: Palette.secondary),
                              Text(
                                t.gallery,
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
