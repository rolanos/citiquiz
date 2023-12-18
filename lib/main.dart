import 'package:citiquiz/features/auth/view/auth_screen.dart';
import 'package:citiquiz/features/auth/view/bloc/authentication_bloc.dart';
import 'package:citiquiz/features/core/theme.dart';
import 'package:citiquiz/features/qr/bloc/qr_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/view/splash_screen.dart';
import 'features/home_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PermissionStatus status = await _getCameraPermission();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isOnboarding = true;
  String? email = await preferences.getString('email');
  if (email != null) {
    isOnboarding = false;
  }
  runApp(
    MyApp(
      isOnboarding: isOnboarding,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isOnboarding;
  const MyApp({super.key, this.isOnboarding = true});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc()..add(Init()),
        ),
        BlocProvider(
          create: (context) => QrBloc(),
        ),
      ],
      child: MaterialApp(
        theme: getTheme(),
        home: isOnboarding ? AuthScreen() : HomeScreen(),
      ),
    );
  }
}

Future<PermissionStatus> _getCameraPermission() async {
  var status = await Permission.camera.status;
  if (!status.isGranted) {
    final result = await Permission.camera.request();
    return result;
  } else {
    return status;
  }
}
