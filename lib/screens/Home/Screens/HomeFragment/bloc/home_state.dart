import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    String? phoneNumber,
  }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState();
  }
}
