import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCoAdTWMcqtWD_YtzzP4BddzRm62ObkZUI",
            authDomain: "farm-9hnwe5.firebaseapp.com",
            projectId: "farm-9hnwe5",
            storageBucket: "farm-9hnwe5.appspot.com",
            messagingSenderId: "726454835178",
            appId: "1:726454835178:web:affef9cb60cdf2d18e8493",
            measurementId: "G-KQ43KSQ8F0"));
  } else {
    await Firebase.initializeApp();
  }
}
