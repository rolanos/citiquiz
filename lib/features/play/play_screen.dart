import 'package:citiquiz/features/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(43, 144, 1, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            "asset/animations/animation.json",
            repeat: true,
            width: MediaQuery.of(context).size.width * 0.35,
          ),
          SizedBox(
            height: 42,
          ),
          Text(
            "В данный момент квизы\nнаходятся в разработке",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 22.0),
          ),
        ],
      ),
    );
  }
}
