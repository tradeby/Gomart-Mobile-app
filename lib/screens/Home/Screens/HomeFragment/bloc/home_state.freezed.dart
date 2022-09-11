// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {bool loadInProgress,
      bool loadFailure,
      bool loadSuccess,
      String? error,
      List<ProductModel>? homeProducts,
      ProductRepositoryOutput? productsOutput});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? loadInProgress = freezed,
    Object? loadFailure = freezed,
    Object? loadSuccess = freezed,
    Object? error = freezed,
    Object? homeProducts = freezed,
    Object? productsOutput = freezed,
  }) {
    return _then(_value.copyWith(
      loadInProgress: loadInProgress == freezed
          ? _value.loadInProgress
          : loadInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailure: loadFailure == freezed
          ? _value.loadFailure
          : loadFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      loadSuccess: loadSuccess == freezed
          ? _value.loadSuccess
          : loadSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      homeProducts: homeProducts == freezed
          ? _value.homeProducts
          : homeProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      productsOutput: productsOutput == freezed
          ? _value.productsOutput
          : productsOutput // ignore: cast_nullable_to_non_nullable
              as ProductRepositoryOutput?,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loadInProgress,
      bool loadFailure,
      bool loadSuccess,
      String? error,
      List<ProductModel>? homeProducts,
      ProductRepositoryOutput? productsOutput});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, (v) => _then(v as _$_HomeState));

  @override
  _$_HomeState get _value => super._value as _$_HomeState;

  @override
  $Res call({
    Object? loadInProgress = freezed,
    Object? loadFailure = freezed,
    Object? loadSuccess = freezed,
    Object? error = freezed,
    Object? homeProducts = freezed,
    Object? productsOutput = freezed,
  }) {
    return _then(_$_HomeState(
      loadInProgress: loadInProgress == freezed
          ? _value.loadInProgress
          : loadInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      loadFailure: loadFailure == freezed
          ? _value.loadFailure
          : loadFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      loadSuccess: loadSuccess == freezed
          ? _value.loadSuccess
          : loadSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      homeProducts: homeProducts == freezed
          ? _value._homeProducts
          : homeProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      productsOutput: productsOutput == freezed
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
  final String? error;
  final List<ProductModel>? _homeProducts;
  @override
  List<ProductModel>? get homeProducts {
    final value = _homeProducts;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ProductRepositoryOutput? productsOutput;

  @override
  String toString() {
    return 'HomeState(loadInProgress: $loadInProgress, loadFailure: $loadFailure, loadSuccess: $loadSuccess, error: $error, homeProducts: $homeProducts, productsOutput: $productsOutput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality()
                .equals(other.loadInProgress, loadInProgress) &&
            const DeepCollectionEquality()
                .equals(other.loadFailure, loadFailure) &&
            const DeepCollectionEquality()
                .equals(other.loadSuccess, loadSuccess) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other._homeProducts, _homeProducts) &&
            const DeepCollectionEquality()
                .equals(other.productsOutput, productsOutput));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loadInProgress),
      const DeepCollectionEquality().hash(loadFailure),
      const DeepCollectionEquality().hash(loadSuccess),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(_homeProducts),
      const DeepCollectionEquality().hash(productsOutput));

  @JsonKey(ignore: true)
  @override
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final bool loadInProgress,
      required final bool loadFailure,
      required final bool loadSuccess,
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
