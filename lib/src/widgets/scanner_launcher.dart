// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/widgets/image_picker.dart';

class ScannerLauncher extends StatelessWidget {
  const ScannerLauncher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: context.colorScheme.primary,
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return const ImagePickModal();
            },
          );
          // FirebaseAuthentication.isPreniumUser
          //     ? showModalBottomSheet(
          //         backgroundColor: Colors.transparent,
          //         context: context,
          //         builder: (context) {
          //           return const ImagePickModal();
          //         },
          //       )
          //     : context.autorouter.pushNamed('/purchase');
        },
        icon: const Icon(
          Icons.document_scanner,
          color: Palette.light,
        ),
      ),
    );
  }
}
