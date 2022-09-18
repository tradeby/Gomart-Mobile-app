import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:gomart/data/model/FlagCountryCode/flag_country_code.dart';
import 'package:gomart/data/repository/User/IUserRepository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Register/bloc/registration_cubit.dart';
import 'login_state.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _firebaseAuth;
  final IUserRepository _userRepository;

  LoginCubit(this._firebaseAuth, this._userRepository)
      : super(LoginState.initial());

  Future<void> checkForPreviousPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
    String? phoneNumber = prefs.getString('savedPhoneNumber');
    String? flagCountryId = prefs.getString('flagCountryId');
    if (kDebugMode) {
      print(
          '*********** getting phoneNumber and flag countryId $phoneNumber $flagCountryId');
    }
    if (phoneNumber != null) {
      if (kDebugMode) {
        print('*********** saved Phone number is not null');
      }
      setPhoneNumber(phoneNumber);
      List<FlagCountryCodeModel> foundFlag = FlagCountryCodeModel
          .getSupportedList
          .where((flag) => flag.id == flagCountryId)
          .toList();
      if (foundFlag.isNotEmpty) {
        setFlagCountryCode(foundFlag[0]);
      }
    }
    //checkFor previous phoneNumber
    //if found

    //else do nothing
  }

  void setPhoneNumber(_) => emit(state.copyWith(phoneNumber: sanitizeInput(_)));

  void setFlagCountryCode(_) => emit(state.copyWith(selectedCountry: _));

  void setVerificationCode(_) => emit(state.copyWith(verificationId: _));

  void setOtpCode(_) => emit(state.copyWith(otp: sanitizeInput(_)));

  void setStatus(_) => emit(state.copyWith(status: _));

  void prepareCredentialAndLogin() {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: state.verificationId as String,
        smsCode: state.otp as String);
    loginUser(credential);
  }

  Future<void> loginUser(PhoneAuthCredential credential) async {
    // call our user repository here!
    try {
      await _userRepository.signIn(
        credential: credential,
      );
      if (kDebugMode) {
        print('********* Login successful !');
      }
      emit(state.copyWith(loginSuccessful: true));
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('savedPhoneNumber', state.phoneNumber as String);
      await prefs.setString(
          'flagCountryId', state.selectedCountry?.id as String);
      setStatus('Login successful !');
    } catch (e) {
      if (kDebugMode) {
        print('********* Login failed !');
      }
      setStatus(e);
      emit(state.copyWith(loginSuccessful: false));
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
        loginUser(credential);
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
        //setStatus('verification failed  phoneNumber: $phoneNumber $e');
        setStatus(e);
        emit(state.copyWith(loginSuccessful: false));
        if (kDebugMode) {
          print('verification failed  phoneNumber: $phoneNumber $e');
        }
      },
    );
  }
}
