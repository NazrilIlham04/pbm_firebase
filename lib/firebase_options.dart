// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCZz-xwc2ZMTK2lFh7n-pycz12gxCZWQQg',
    appId: '1:473248750070:web:2bf49ee58c431aaef7cfd7',
    messagingSenderId: '473248750070',
    projectId: 'fir-pbm-3e946',
    authDomain: 'fir-pbm-3e946.firebaseapp.com',
    storageBucket: 'fir-pbm-3e946.firebasestorage.app',
    measurementId: 'G-S8NPM97RZR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDf2T8KqJo0qQSRA9ELwRh1dZSqTVydXA0',
    appId: '1:473248750070:android:1b1926faf98c47fbf7cfd7',
    messagingSenderId: '473248750070',
    projectId: 'fir-pbm-3e946',
    storageBucket: 'fir-pbm-3e946.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNFVmuAPxIaT7e4IkVWJoZmMjSuyKxAsg',
    appId: '1:473248750070:ios:7a91cd843ad990cbf7cfd7',
    messagingSenderId: '473248750070',
    projectId: 'fir-pbm-3e946',
    storageBucket: 'fir-pbm-3e946.firebasestorage.app',
    iosBundleId: 'com.example.pbmFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNFVmuAPxIaT7e4IkVWJoZmMjSuyKxAsg',
    appId: '1:473248750070:ios:7a91cd843ad990cbf7cfd7',
    messagingSenderId: '473248750070',
    projectId: 'fir-pbm-3e946',
    storageBucket: 'fir-pbm-3e946.firebasestorage.app',
    iosBundleId: 'com.example.pbmFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCZz-xwc2ZMTK2lFh7n-pycz12gxCZWQQg',
    appId: '1:473248750070:web:3d1f061b04ea7293f7cfd7',
    messagingSenderId: '473248750070',
    projectId: 'fir-pbm-3e946',
    authDomain: 'fir-pbm-3e946.firebaseapp.com',
    storageBucket: 'fir-pbm-3e946.firebasestorage.app',
    measurementId: 'G-3CZ1K188R2',
  );
}
