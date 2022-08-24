import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';

class Button extends StatelessWidget {
  final String label;
  final bool isLoading;
  final VoidCallback callback;
  const Button(
      {Key? key,
      required this.label,
      required this.isLoading,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Center(
        child: Container(
            width: context.screenWidth * 0.8,
            height: 48.0,
            decoration: BoxDecoration(
              color: const Color(0xFF337669),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Center(
                child: Text(
              label,
              style: Styles.designText(
                  bold: false, color: Palette.light, size: 24),
            ))),
      ),
    );
  }
}
