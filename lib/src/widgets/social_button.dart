import 'package:alora/src/configs/index.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback callback;
  final String iconAsset;
  const SocialButton(
      {Key? key, required this.callback, required this.iconAsset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 76.0,
        height: 58.0,
        decoration: BoxDecoration(
          color: Colors.white30,
          border: Border.all(color: Palette.light, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
            child: Image.asset(
          iconAsset,
          height: 30,
          width: 30,
        )),
      ),
    );
  }
}
