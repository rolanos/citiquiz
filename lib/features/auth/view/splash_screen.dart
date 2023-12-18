import 'package:citiquiz/features/auth/view/auth_screen.dart';
import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/core/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => AuthScreen(),
          transitionDuration: Duration(milliseconds: 370),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  appLogoPath,
                  width: size.width * 0.75,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                poweredByPath,
                width: size.width * 0.25,
                //colorFilter: ColorFilter.mode(ColorsUI.lime, BlendMode.srcIn),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
