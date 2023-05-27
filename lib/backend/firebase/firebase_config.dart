import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBWuXrxksurMsqcV05z5nvF7I1hRywf2s0",
            authDomain: "paynager-96444.firebaseapp.com",
            projectId: "paynager-96444",
            storageBucket: "paynager-96444.appspot.com",
            messagingSenderId: "187905463675",
            appId: "1:187905463675:web:ebf467f7ee2c1acf2419de",
            measurementId: "G-QDFH47S3B9"));
  } else {
    await Firebase.initializeApp();
  }
}
