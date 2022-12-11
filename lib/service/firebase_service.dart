import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';

class FirebaseService {
  static Future<FirebaseService> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseAppCheck.instance.activate(
        webRecaptchaSiteKey: 'recaptcha-v3-site-key',
        // Set androidProvider to `AndroidProvider.debug`
        androidDebugProvider: true);
   /* print("********************************* activated app check");
    String? token = await FirebaseAppCheck.instance.getToken();
    print("************ our debug token is ${token ?? "no token found"}");*/
    return FirebaseService();
  }
}
