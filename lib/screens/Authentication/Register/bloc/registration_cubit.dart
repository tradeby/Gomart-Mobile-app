import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:gomart/data/model/FlagCountryCode/flag_country_code.dart';
import 'package:gomart/data/repository/User/IUserRepository.dart';
import 'package:gomart/screens/Authentication/Register/bloc/register_state.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class RegistrationCubit extends Cubit<RegisterState> {
  final FirebaseAuth _firebaseAuth;
  final IUserRepository _userRepository;

  RegistrationCubit(this._firebaseAuth, this._userRepository)
      : super(RegisterState.initial());

  void setPhoneNumber(_) => emit(state.copyWith(phoneNumber: sanitizeInput(_)));

  void setFirstName(_) => emit(state.copyWith(firstName: sanitizeInput(_)));

  void setLastName(_) => emit(state.copyWith(lastName: sanitizeInput(_)));

  void setDateOfBirth(_) => emit(state.copyWith(dateOfBirth: _));

  void setFlagCountryCode(_) => emit(state.copyWith(selectedCountry: _));

  void setOtpCode(_) => emit(state.copyWith(otp: sanitizeInput(_)));

  void setVerificationCode(_) => emit(state.copyWith(verificationId: _));

  void setStatus(_) => emit(state.copyWith(status: _));

  void setProfileImage(croppedImagePath) =>
      emit(state.copyWith(photoUrl: croppedImagePath));

  //RegisterWithOtpCode
  void prepareCredentialAndLogin() {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: state.verificationId as String,
        smsCode: state.otp as String);
    registerNewUser(credential);
  }

  Future<void> registerNewUser(PhoneAuthCredential credential) async {
    // call our user repository here!
    try {
      FlagCountryCodeModel country =
          state.selectedCountry as FlagCountryCodeModel;
      await _userRepository.register(
        firstName: state.firstName as String,
        lastName: state.lastName as String,
        phoneNumber: state.phoneNumber as String,
        country: country,
        localPhotoUrl: state.photoUrl,
        credential: credential,
      );
      if (kDebugMode) {
        print('********* Login successful !');
      }
      emit(state.copyWith(registrationSuccessful: true));
      setStatus('Login successful countryId ${country.id})!');
      // obtain shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('savedPhoneNumber', state.phoneNumber as String);
      await prefs.setString('flagCountryId', country.id);
    } catch (e) {
      if (kDebugMode) {
        print('********* Login failed !');
      }

      setStatus(e);
      emit(state.copyWith(registrationSuccessful: false));
    }
  }

  Future<void> verifyPhoneNumber() async {
    String phoneNumber =
        '${state.selectedCountry?.countryCode}${state.phoneNumber}';
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        //set phoneAuthCredential for signIn
        registerNewUser(credential);
        setStatus('verification complete phoneNumber: $phoneNumber');
        if (kDebugMode) {
          print('verification complete  phoneNumber: $phoneNumber');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        //take verificationId and
        setVerificationCode(verificationId);
        setStatus(
            'code sent, phoneNumber: $phoneNumber verificationId: $verificationId resendToken: $resendToken');
        if (kDebugMode) {
          print(
              'code sent,  phoneNumber: $phoneNumber verificationId:  $verificationId resendToken: $resendToken');
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setStatus(
            'code auto retrival timeout, phoneNumber: $phoneNumber verificationId: $verificationId');
        if (kDebugMode) {
          print(
              'code auto retrival timeout, phoneNumber: $phoneNumber verificationId: $verificationId');
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        setStatus(e);
        emit(state.copyWith(registrationSuccessful: false));
        setStatus('verification failed  phoneNumber: $phoneNumber $e');
        if (kDebugMode) {
          print('verification failed  phoneNumber: $phoneNumber $e');
        }
      },
    );
  }

  void removeProfilePhoto() => emit(state.copyWith(photoUrl: null));
}

String? sanitizeInput(String? input) {
  if (input?.isEmpty ?? true) return null;
  if (input?.trim().isEmpty ?? true) return null;
  return input?.trim();
}
