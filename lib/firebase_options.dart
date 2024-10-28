import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC6eBmKlmkOKkRV0GgY2DDUJzP7daOIJq0',
    appId: '1:22292645860:web:6dfb335b7e9de1999829f1',
    messagingSenderId: '22292645860',
    projectId: 'twitterclone-71fb1',
    authDomain: 'twitterclone-71fb1.firebaseapp.com',
    storageBucket: 'twitterclone-71fb1.appspot.com',
    measurementId: 'G-M0K9E1L52T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfYVFzL7iTvLK6Qvo9a5_gkZ-OBxzyqOI',
    appId: '1:22292645860:android:311d9c1e6de86d369829f1',
    messagingSenderId: '22292645860',
    projectId: 'twitterclone-71fb1',
    storageBucket: 'twitterclone-71fb1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzziAmw0pjbGsWgKetzihFvv8FYopWctM',
    appId: '1:22292645860:ios:656ba6b94d70a31b9829f1',
    messagingSenderId: '22292645860',
    projectId: 'twitterclone-71fb1',
    storageBucket: 'twitterclone-71fb1.appspot.com',
    iosBundleId: 'com.example.project1',
  );
}
