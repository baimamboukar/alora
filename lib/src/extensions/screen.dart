import 'package:flutter/cupertino.dart';

extension Screen on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.width;
  double screenWidthPercent(double percentage) =>
      MediaQuery.of(this).size.width * (percentage / 100);
  double screenHeightPercent(double percentage) =>
      MediaQuery.of(this).size.height * (percentage / 100);

  double netHeight(double size) =>
      (MediaQuery.of(this).size.height * size) / 1365;
  double netWidth(double size) => (MediaQuery.of(this).size.width * size) / 375;
}
