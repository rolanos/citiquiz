import 'package:citiquiz/features/core/colors.dart';
import 'package:flutter/material.dart';

class StoryWidgetContainer extends StatelessWidget {
  final String text;
  final String assetPath;

  const StoryWidgetContainer(
      {super.key, required this.text, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      width: size.width * 0.2,
      decoration: BoxDecoration(
        color: ColorsUI.red,
        image: DecorationImage(
            image: AssetImage(
              assetPath,
            ),
            fit: BoxFit.fitHeight),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: size.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4.0)),
            ),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
