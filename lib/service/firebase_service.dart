import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../firebase_options.dart';

class FirebaseService {
  static Future<FirebaseService> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseAppCheck.instance.activate(
        webRecaptchaSiteKey: 'recaptcha-v3-site-key',
        // Set androidProvider to `AndroidProvider.debug`
        androidDebugProvider: kDebugMode);
   /* print("********************************* activated app check");*/

    if (kDebugMode) {
      print("************ our debug token is ${ "no token found"}");
    }
    return FirebaseService();
  }
}
