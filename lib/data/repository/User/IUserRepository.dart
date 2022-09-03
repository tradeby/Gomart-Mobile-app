import 'package:firebase_auth/firebase_auth.dart';

import '../../model/FlagCountryCode/flag_country_code.dart';

abstract class IUserRepository {
  Future<void> signIn({
    required String phoneNumber,
    required PhoneAuthCredential credential,
  });

  Future<void> register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required FlagCountryCodeModel country,
    required PhoneAuthCredential credential,
    DateTime? dateOfBirth,
    String? localPhotoUrl,
  });

  Future<bool> checkIfUserExists();
  //Future<User?> getUser();
  Future<void> signOut();

  bool isSignedIn();
}
