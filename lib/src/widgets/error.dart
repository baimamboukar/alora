import 'package:grnagain/src/configs/index.dart';
import 'package:flutter/widgets.dart';

class ErrorView extends StatelessWidget {
  final String error;
  final String desc;
  const ErrorView({Key? key, required this.error, required this.desc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            error,
            style:
                Styles.designText(bold: true, color: Palette.light, size: 22),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            desc,
            style: Styles.designText(
                bold: false, color: Palette.secondary, size: 14),
          ),
        ],
      ),
    );
  }
}
