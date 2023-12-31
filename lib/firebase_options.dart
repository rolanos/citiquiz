// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC07vzIrYZOS2PucmPQewx-KfewmDGAXwg',
    appId: '1:585862733617:web:5055ef2526083051a0da10',
    messagingSenderId: '585862733617',
    projectId: 'citiquiz-91848',
    authDomain: 'citiquiz-91848.firebaseapp.com',
    storageBucket: 'citiquiz-91848.appspot.com',
    measurementId: 'G-0SCCYQ6VYH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVqDxpYmEakHlc4rtrY_EHka4x2NvpF8E',
    appId: '1:585862733617:android:381b83b7a54a0aaea0da10',
    messagingSenderId: '585862733617',
    projectId: 'citiquiz-91848',
    storageBucket: 'citiquiz-91848.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6mAk_TU3yWUbQghhDEFvLv2T6v6A62Y4',
    appId: '1:585862733617:ios:c48a16139008f043a0da10',
    messagingSenderId: '585862733617',
    projectId: 'citiquiz-91848',
    storageBucket: 'citiquiz-91848.appspot.com',
    iosBundleId: 'com.example.citiquiz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6mAk_TU3yWUbQghhDEFvLv2T6v6A62Y4',
    appId: '1:585862733617:ios:0e5956636d3ccfdca0da10',
    messagingSenderId: '585862733617',
    projectId: 'citiquiz-91848',
    storageBucket: 'citiquiz-91848.appspot.com',
    iosBundleId: 'com.example.citiquiz.RunnerTests',
  );
}
