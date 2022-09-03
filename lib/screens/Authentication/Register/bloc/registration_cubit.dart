import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:gomart/screens/Authentication/Register/bloc/register_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegistrationCubit extends Cubit<RegisterState> {
  final FirebaseAuth _firebaseAuth;

  RegistrationCubit(this._firebaseAuth) : super(RegisterState.initial());

  void setPhoneNumber(_) => emit(state.copyWith(phoneNumber: sanitizeInput(_)));

  void setFirstName(_) => emit(state.copyWith(firstName: sanitizeInput(_)));

  void setLastName(_) => emit(state.copyWith(lastName: sanitizeInput(_)));

  void setDateOfBirth(_) => emit(state.copyWith(dateOfBirth: _));

  void setFlagCountryCode(_) => emit(state.copyWith(selectedCountry: _));

  void setStatus(_) => emit(state.copyWith(status: _));

  void setProfileImage(croppedImagePath) =>
      emit(state.copyWith(photoUrl: croppedImagePath));

  Future<void> verifyPhoneNumber() async {
    String phoneNumber = '${state.selectedCountry?.countryCode}${state.phoneNumber}';
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        setStatus('verification complete phoneNumber: $phoneNumber');
        if (kDebugMode) {
          print('verification complete  phoneNumber: $phoneNumber');
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        setStatus('verification failed  phoneNumber: $phoneNumber $e');
        if (kDebugMode) {
          print('verification failed  phoneNumber: $phoneNumber $e');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
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
          print('code auto retrival timeout, phoneNumber: $phoneNumber verificationId: $verificationId');
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
