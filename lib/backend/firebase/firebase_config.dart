import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA9nuizxxhizK72l40KL98684F54vHVQuY",
            authDomain: "musalla-b1ad2.firebaseapp.com",
            projectId: "musalla-b1ad2",
            storageBucket: "musalla-b1ad2.appspot.com",
            messagingSenderId: "531913213367",
            appId: "1:531913213367:web:5d3b0bec15a0f91114d432",
            measurementId: "G-E3Q1LZ9ZM8"));
  } else {
    await Firebase.initializeApp();
  }
}
