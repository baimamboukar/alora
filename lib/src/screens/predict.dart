import 'dart:io';

import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/riverpods/prediction_services_riverpod.dart';
import 'package:grnagain/src/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:lottie/lottie.dart';

class Predict extends ConsumerWidget {
  final XFile image;
  const Predict({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final predicter = ref.watch(predicterRiverpod(image));
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Prediction",
            style: Styles.designText(
                bold: false, size: 14, color: Palette.primary)),
      ),
      body: predicter.when(
        data: (data) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.file(
                  File(image.path),
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Disease",
                          style: Styles.designText(
                              bold: true, size: 16, color: Palette.primary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Palette.primary,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(data.prediction,
                            style: Styles.designText(
                                bold: true, size: 14, color: Palette.light)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 14),
                child: Row(
                  children: [
                    Text(
                      "Description",
                      style: Styles.designText(
                          bold: true, size: 16, color: Palette.primary),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Palette.primary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          data.description,
                          style: Styles.designText(
                              bold: false, size: 14, color: Palette.light),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          "Symptoms",
                          style: Styles.designText(
                              bold: true, size: 16, color: Palette.light),
                        ),
                        Text(data.symptoms,
                            style: Styles.designText(
                                bold: true, size: 16, color: Palette.light)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Get to the source",
                          style: Styles.designText(
                              bold: true, size: 16, color: Palette.primary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Palette.primary,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(data.source,
                            style: Styles.designText(
                                bold: true, size: 14, color: Palette.light)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Processing image...",
              style: Styles.designText(
                  color: Palette.primary, size: 20, bold: true),
            ),
            Stack(
              children: [
                Lottie.asset('assets/images/leaves.json'),
                Lottie.asset('assets/images/leaf.json',
                    width: 300, height: 300),
              ],
            ),
          ],
        )),
        error: (err, trace) => const ErrorView(
          desc: "Failed to upload image, connection timeout",
          error: "Something went wrong",
        ),
      ),
    );
  }
}
