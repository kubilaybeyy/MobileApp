import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCNBcDFbA0HBnVLLNeTKPIPQCURFrhq9ic",
            authDomain: "cafe-ordering-system.firebaseapp.com",
            projectId: "cafe-ordering-system",
            storageBucket: "cafe-ordering-system.appspot.com",
            messagingSenderId: "967858526576",
            appId: "1:967858526576:web:66f8f8c91f0f0dcd4d17b5",
            measurementId: "G-C210K6Y30B"));
  } else {
    await Firebase.initializeApp();
  }
}
