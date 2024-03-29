// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  bool get searchInProgress => throw _privateConstructorUsedError;
  bool get searchFailure => throw _privateConstructorUsedError;
  bool get searchSuccess => throw _privateConstructorUsedError;
  String? get searchTerm => throw _privateConstructorUsedError;
  List<ProductModel> get searchResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {bool searchInProgress,
      bool searchFailure,
      bool searchSuccess,
      String? searchTerm,
      List<ProductModel> searchResults});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchInProgress = null,
    Object? searchFailure = null,
    Object? searchSuccess = null,
    Object? searchTerm = freezed,
    Object? searchResults = null,
  }) {
    return _then(_value.copyWith(
      searchInProgress: null == searchInProgress
          ? _value.searchInProgress
          : searchInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      searchFailure: null == searchFailure
          ? _value.searchFailure
          : searchFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      searchSuccess: null == searchSuccess
          ? _value.searchSuccess
          : searchSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      searchTerm: freezed == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool searchInProgress,
      bool searchFailure,
      bool searchSuccess,
      String? searchTerm,
      List<ProductModel> searchResults});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_SearchState>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchInProgress = null,
    Object? searchFailure = null,
    Object? searchSuccess = null,
    Object? searchTerm = freezed,
    Object? searchResults = null,
  }) {
    return _then(_$_SearchState(
      searchInProgress: null == searchInProgress
          ? _value.searchInProgress
          : searchInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      searchFailure: null == searchFailure
          ? _value.searchFailure
          : searchFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      searchSuccess: null == searchSuccess
          ? _value.searchSuccess
          : searchSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      searchTerm: freezed == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      searchResults: null == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {required this.searchInProgress,
      required this.searchFailure,
      required this.searchSuccess,
      this.searchTerm,
      required final List<ProductModel> searchResults})
      : _searchResults = searchResults;

  @override
  final bool searchInProgress;
  @override
  final bool searchFailure;
  @override
  final bool searchSuccess;
  @override
  final String? searchTerm;
  final List<ProductModel> _searchResults;
  @override
  List<ProductModel> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  String toString() {
    return 'SearchState(searchInProgress: $searchInProgress, searchFailure: $searchFailure, searchSuccess: $searchSuccess, searchTerm: $searchTerm, searchResults: $searchResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            (identical(other.searchInProgress, searchInProgress) ||
                other.searchInProgress == searchInProgress) &&
            (identical(other.searchFailure, searchFailure) ||
                other.searchFailure == searchFailure) &&
            (identical(other.searchSuccess, searchSuccess) ||
                other.searchSuccess == searchSuccess) &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchInProgress,
      searchFailure,
      searchSuccess,
      searchTerm,
      const DeepCollectionEquality().hash(_searchResults));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {required final bool searchInProgress,
      required final bool searchFailure,
      required final bool searchSuccess,
      final String? searchTerm,
      required final List<ProductModel> searchResults}) = _$_SearchState;

  @override
  bool get searchInProgress;
  @override
  bool get searchFailure;
  @override
  bool get searchSuccess;
  @override
  String? get searchTerm;
  @override
  List<ProductModel> get searchResults;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
