import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../firebase_options.dart';

class FirebaseService {
  static Future<FirebaseService> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (kDebugMode) {
    await FirebaseAppCheck.instance.activate(
        webRecaptchaSiteKey: '6Les_nQjAAAAANPhLUiLL_Vu9ZNLXi7UTWnfVUxK',
        // Set androidProvider to `AndroidProvider.debug`
        androidDebugProvider: true);
   /* print("********************************* activated app check");*/


      print("************ our debug token is ${ "no token found"}");
    }
    return FirebaseService();
  }
}
