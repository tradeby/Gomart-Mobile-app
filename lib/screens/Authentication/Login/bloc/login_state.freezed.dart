// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;
  FlagCountryCodeModel? get selectedCountry =>
      throw _privateConstructorUsedError;
  bool? get loginSuccessful => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {String? phoneNumber,
      String? status,
      String? verificationId,
      String? otp,
      FlagCountryCodeModel? selectedCountry,
      bool? loginSuccessful});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? status = freezed,
    Object? verificationId = freezed,
    Object? otp = freezed,
    Object? selectedCountry = freezed,
    Object? loginSuccessful = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCountry: selectedCountry == freezed
          ? _value.selectedCountry
          : selectedCountry // ignore: cast_nullable_to_non_nullable
              as FlagCountryCodeModel?,
      loginSuccessful: loginSuccessful == freezed
          ? _value.loginSuccessful
          : loginSuccessful // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? phoneNumber,
      String? status,
      String? verificationId,
      String? otp,
      FlagCountryCodeModel? selectedCountry,
      bool? loginSuccessful});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, (v) => _then(v as _$_LoginState));

  @override
  _$_LoginState get _value => super._value as _$_LoginState;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? status = freezed,
    Object? verificationId = freezed,
    Object? otp = freezed,
    Object? selectedCountry = freezed,
    Object? loginSuccessful = freezed,
  }) {
    return _then(_$_LoginState(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCountry: selectedCountry == freezed
          ? _value.selectedCountry
          : selectedCountry // ignore: cast_nullable_to_non_nullable
              as FlagCountryCodeModel?,
      loginSuccessful: loginSuccessful == freezed
          ? _value.loginSuccessful
          : loginSuccessful // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_LoginState with DiagnosticableTreeMixin implements _LoginState {
  const _$_LoginState(
      {this.phoneNumber,
      this.status,
      this.verificationId,
      this.otp,
      this.selectedCountry,
      this.loginSuccessful});

  @override
  final String? phoneNumber;
  @override
  final String? status;
  @override
  final String? verificationId;
  @override
  final String? otp;
  @override
  final FlagCountryCodeModel? selectedCountry;
  @override
  final bool? loginSuccessful;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState(phoneNumber: $phoneNumber, status: $status, verificationId: $verificationId, otp: $otp, selectedCountry: $selectedCountry, loginSuccessful: $loginSuccessful)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState'))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('verificationId', verificationId))
      ..add(DiagnosticsProperty('otp', otp))
      ..add(DiagnosticsProperty('selectedCountry', selectedCountry))
      ..add(DiagnosticsProperty('loginSuccessful', loginSuccessful));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.verificationId, verificationId) &&
            const DeepCollectionEquality().equals(other.otp, otp) &&
            const DeepCollectionEquality()
                .equals(other.selectedCountry, selectedCountry) &&
            const DeepCollectionEquality()
                .equals(other.loginSuccessful, loginSuccessful));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(verificationId),
      const DeepCollectionEquality().hash(otp),
      const DeepCollectionEquality().hash(selectedCountry),
      const DeepCollectionEquality().hash(loginSuccessful));

  @JsonKey(ignore: true)
  @override
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {final String? phoneNumber,
      final String? status,
      final String? verificationId,
      final String? otp,
      final FlagCountryCodeModel? selectedCountry,
      final bool? loginSuccessful}) = _$_LoginState;

  @override
  String? get phoneNumber;
  @override
  String? get status;
  @override
  String? get verificationId;
  @override
  String? get otp;
  @override
  FlagCountryCodeModel? get selectedCountry;
  @override
  bool? get loginSuccessful;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
