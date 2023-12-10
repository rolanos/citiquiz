import 'package:auto_size_text/auto_size_text.dart';
import 'package:citiquiz/features/core/colors.dart';
import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const ContainerButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: ColorsUI.lime,
        ),
        child: Center(
          child: AutoSizeText(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: ColorsUI.black, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
