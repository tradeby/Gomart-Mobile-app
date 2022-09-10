
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';
@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    String? phoneNumber,
  }) = _SearchState;

  factory SearchState.initial() {
    return const SearchState();
  }
}
