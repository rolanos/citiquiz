import 'package:citiquiz/features/core/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  const InputField(
      {super.key, required this.hintText, required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 18.0,
        ),
        label: Icon(
          prefixIcon,
          color: ColorsUI.lime,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsUI.lime,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsUI.lime,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsUI.lime,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        hintText: hintText,
        hintStyle: textTheme.bodyMedium,
        // prefixIcon: Icon(
        //   prefixIcon,
        //   color: ColorsUI.lime,
        // ),
      ),
    );
  }
}
