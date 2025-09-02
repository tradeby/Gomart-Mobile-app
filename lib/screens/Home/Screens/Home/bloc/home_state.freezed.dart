// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  bool get loadInProgress => throw _privateConstructorUsedError;
  bool get loadFailure => throw _privateConstructorUsedError;
  bool get loadSuccess => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<ProductModel>? get homeProducts => throw _privateConstructorUsedError;
  ProductRepositoryOutput? get productsOutput =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool loadInProgress,
      bool loadFailure,
      bool loadSuccess,
      double longitude,
      double latitude,
      String? error,
      List<ProductModel>? homeProducts,
      ProductRepositoryOutput? productsOutput});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadInProgress = null,
    Object? loadFailure = null,
    Object? loadSuccess = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? error = freezed,
    Object? homeProducts = freezed,
    Object? productsOutput = freezed,
  }) {
    return _then(_value.copyWith(
      loadInProgress: null == loadInProgress
          ? _value.loadInProgress
          : loadInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailure: null == loadFailure
          ? _value.loadFailure
          : loadFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      loadSuccess: null == loadSuccess
          ? _value.loadSuccess
          : loadSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      homeProducts: freezed == homeProducts
          ? _value.homeProducts
          : homeProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      productsOutput: freezed == productsOutput
          ? _value.productsOutput
          : productsOutput // ignore: cast_nullable_to_non_nullable
              as ProductRepositoryOutput?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loadInProgress,
      bool loadFailure,
      bool loadSuccess,
      double longitude,
      double latitude,
      String? error,
      List<ProductModel>? homeProducts,
      ProductRepositoryOutput? productsOutput});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadInProgress = null,
    Object? loadFailure = null,
    Object? loadSuccess = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? error = freezed,
    Object? homeProducts = freezed,
    Object? productsOutput = freezed,
  }) {
    return _then(_$_HomeState(
      loadInProgress: null == loadInProgress
          ? _value.loadInProgress
          : loadInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailure: null == loadFailure
          ? _value.loadFailure
          : loadFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      loadSuccess: null == loadSuccess
          ? _value.loadSuccess
          : loadSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      homeProducts: freezed == homeProducts
          ? _value._homeProducts
          : homeProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      productsOutput: freezed == productsOutput
          ? _value.productsOutput
          : productsOutput // ignore: cast_nullable_to_non_nullable
              as ProductRepositoryOutput?,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {required this.loadInProgress,
      required this.loadFailure,
      required this.loadSuccess,
      required this.longitude,
      required this.latitude,
      this.error,
      final List<ProductModel>? homeProducts,
      this.productsOutput})
      : _homeProducts = homeProducts;

  @override
  final bool loadInProgress;
  @override
  final bool loadFailure;
  @override
  final bool loadSuccess;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String? error;
  final List<ProductModel>? _homeProducts;
  @override
  List<ProductModel>? get homeProducts {
    final value = _homeProducts;
    if (value == null) return null;
    if (_homeProducts is EqualUnmodifiableListView) return _homeProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ProductRepositoryOutput? productsOutput;

  @override
  String toString() {
    return 'HomeState(loadInProgress: $loadInProgress, loadFailure: $loadFailure, loadSuccess: $loadSuccess, longitude: $longitude, latitude: $latitude, error: $error, homeProducts: $homeProducts, productsOutput: $productsOutput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.loadInProgress, loadInProgress) ||
                other.loadInProgress == loadInProgress) &&
            (identical(other.loadFailure, loadFailure) ||
                other.loadFailure == loadFailure) &&
            (identical(other.loadSuccess, loadSuccess) ||
                other.loadSuccess == loadSuccess) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._homeProducts, _homeProducts) &&
            (identical(other.productsOutput, productsOutput) ||
                other.productsOutput == productsOutput));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loadInProgress,
      loadFailure,
      loadSuccess,
      longitude,
      latitude,
      error,
      const DeepCollectionEquality().hash(_homeProducts),
      productsOutput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final bool loadInProgress,
      required final bool loadFailure,
      required final bool loadSuccess,
      required final double longitude,
      required final double latitude,
      final String? error,
      final List<ProductModel>? homeProducts,
      final ProductRepositoryOutput? productsOutput}) = _$_HomeState;

  @override
  bool get loadInProgress;
  @override
  bool get loadFailure;
  @override
  bool get loadSuccess;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  String? get error;
  @override
  List<ProductModel>? get homeProducts;
  @override
  ProductRepositoryOutput? get productsOutput;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
