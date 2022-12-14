import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:gomart/data/model/FlagCountryCode/flag_country_code.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    String? phoneNumber,
    String? status,
    String? verificationId,
    String? otp,
    FlagCountryCodeModel? selectedCountry,
    bool? loginSuccessful,
  }) = _LoginState;

  factory LoginState.initial() {
    return LoginState(
        selectedCountry: FlagCountryCodeModel.getSupportedList[0]);
  }
}

