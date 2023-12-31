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
    apiKey: 'AIzaSyBf650CKeGC75SNSZmSw3tW7df6HxssUek',
    appId: '1:469015532417:web:5c59e72e88cb738dd58e80',
    messagingSenderId: '469015532417',
    projectId: 'smart-parking-system-fa4bf',
    authDomain: 'smart-parking-system-fa4bf.firebaseapp.com',
    databaseURL: 'https://smart-parking-system-fa4bf-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-parking-system-fa4bf.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAlU04Ul2KMfVcEWtMNsMefLMPlJxyJ9A',
    appId: '1:469015532417:android:6ce49417730a6de3d58e80',
    messagingSenderId: '469015532417',
    projectId: 'smart-parking-system-fa4bf',
    databaseURL: 'https://smart-parking-system-fa4bf-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-parking-system-fa4bf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCv2WxSTYqu_NMsik3ocYtkQ7UHCh4NFo',
    appId: '1:469015532417:ios:2b7bfaf9a16be3ddd58e80',
    messagingSenderId: '469015532417',
    projectId: 'smart-parking-system-fa4bf',
    databaseURL: 'https://smart-parking-system-fa4bf-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-parking-system-fa4bf.appspot.com',
    iosBundleId: 'com.example.smartParkingSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCv2WxSTYqu_NMsik3ocYtkQ7UHCh4NFo',
    appId: '1:469015532417:ios:2b7bfaf9a16be3ddd58e80',
    messagingSenderId: '469015532417',
    projectId: 'smart-parking-system-fa4bf',
    databaseURL: 'https://smart-parking-system-fa4bf-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-parking-system-fa4bf.appspot.com',
    iosBundleId: 'com.example.smartParkingSystem',
  );
}
