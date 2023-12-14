import 'package:citiquiz/features/auth/view/auth_screen.dart';
import 'package:citiquiz/features/core/theme.dart';
import 'package:flutter/material.dart';
import 'features/auth/view/splash_screen.dart';
import 'features/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getTheme(),
      home: HomeScreen(),
    );
  }
}
