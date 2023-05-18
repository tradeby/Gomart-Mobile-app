// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BusinessProfileState {
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  BusinessModel? get business => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BusinessProfileStateCopyWith<BusinessProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessProfileStateCopyWith<$Res> {
  factory $BusinessProfileStateCopyWith(BusinessProfileState value,
          $Res Function(BusinessProfileState) then) =
      _$BusinessProfileStateCopyWithImpl<$Res, BusinessProfileState>;
  @useResult
  $Res call({bool loading, String? error, BusinessModel? business});

  $BusinessModelCopyWith<$Res>? get business;
}

/// @nodoc
class _$BusinessProfileStateCopyWithImpl<$Res,
        $Val extends BusinessProfileState>
    implements $BusinessProfileStateCopyWith<$Res> {
  _$BusinessProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = freezed,
    Object? business = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BusinessModelCopyWith<$Res>? get business {
    if (_value.business == null) {
      return null;
    }

    return $BusinessModelCopyWith<$Res>(_value.business!, (value) {
      return _then(_value.copyWith(business: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BusinessProfileStateCopyWith<$Res>
    implements $BusinessProfileStateCopyWith<$Res> {
  factory _$$_BusinessProfileStateCopyWith(_$_BusinessProfileState value,
          $Res Function(_$_BusinessProfileState) then) =
      __$$_BusinessProfileStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, String? error, BusinessModel? business});

  @override
  $BusinessModelCopyWith<$Res>? get business;
}

/// @nodoc
class __$$_BusinessProfileStateCopyWithImpl<$Res>
    extends _$BusinessProfileStateCopyWithImpl<$Res, _$_BusinessProfileState>
    implements _$$_BusinessProfileStateCopyWith<$Res> {
  __$$_BusinessProfileStateCopyWithImpl(_$_BusinessProfileState _value,
      $Res Function(_$_BusinessProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = freezed,
    Object? business = freezed,
  }) {
    return _then(_$_BusinessProfileState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessModel?,
    ));
  }
}

/// @nodoc

class _$_BusinessProfileState
    with DiagnosticableTreeMixin
    implements _BusinessProfileState {
  const _$_BusinessProfileState(
      {required this.loading, this.error, this.business});

  @override
  final bool loading;
  @override
  final String? error;
  @override
  final BusinessModel? business;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessProfileState(loading: $loading, error: $error, business: $business)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BusinessProfileState'))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('business', business));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BusinessProfileState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.business, business) ||
                other.business == business));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, error, business);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BusinessProfileStateCopyWith<_$_BusinessProfileState> get copyWith =>
      __$$_BusinessProfileStateCopyWithImpl<_$_BusinessProfileState>(
          this, _$identity);
}

abstract class _BusinessProfileState implements BusinessProfileState {
  const factory _BusinessProfileState(
      {required final bool loading,
      final String? error,
      final BusinessModel? business}) = _$_BusinessProfileState;

  @override
  bool get loading;
  @override
  String? get error;
  @override
  BusinessModel? get business;
  @override
  @JsonKey(ignore: true)
  _$$_BusinessProfileStateCopyWith<_$_BusinessProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
