import 'package:grnagain/src/configs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

final isPasswordVisibleRiverpod =
    StateProvider.autoDispose<bool>((ref) => false);

class Input extends ConsumerWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool isPassword;
  final String hint;
  final String? Function(String?)? validator;
  const Input(
      {Key? key,
      required this.controller,
      required this.label,
      required this.icon,
      required this.isPassword,
      required this.hint,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = ref.watch(isPasswordVisibleRiverpod);
    return Column(children: [
      Row(
        children: [
          Text(
            label,
            style:
                Styles.designText(bold: false, color: Palette.dark, size: 18),
          ),
        ],
      ),
      const SizedBox(height: 4),
      Container(
        height: 58.0,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: Palette.light,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: TextFormField(
            validator: validator,
            controller: controller,
            obscureText: isPassword && isPasswordVisible ? true : false,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                icon,
                color: Palette.secondary,
              ),
              suffixIcon: isPassword
                  ? InkWell(
                      onTap: () {
                        ref.read(isPasswordVisibleRiverpod.notifier).state =
                            !ref.read(isPasswordVisibleRiverpod.notifier).state;
                      },
                      child: isPasswordVisible
                          ? const Icon(LineIcons.eyeSlash)
                          : const Icon(LineIcons.eye),
                    )
                  : null,
              hintText: hint,
            ),
          ),
        ),
      )
    ]);
  }
}
