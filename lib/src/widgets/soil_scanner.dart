// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/widgets/image_picker.dart';
import 'package:line_icons/line_icons.dart';

class SoilScanner extends StatelessWidget {
  const SoilScanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: context.colorScheme.primary,
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return const ImagePickModal(forSoilAnalysis: true);
            },
          );
        },
        icon: Icon(
          LineIcons.solarPanel,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
