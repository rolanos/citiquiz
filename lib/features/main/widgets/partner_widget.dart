import 'package:citiquiz/features/core/colors.dart';
import 'package:flutter/material.dart';

class PartnerWidget extends StatelessWidget {
  final String text;

  const PartnerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.25,
      width: size.width * 0.25,
      decoration: BoxDecoration(
        color: ColorsUI.lime,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: ColorsUI.black),
          )
        ],
      ),
    );
  }
}
