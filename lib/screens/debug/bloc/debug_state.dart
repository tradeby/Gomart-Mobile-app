part of 'debug_cubit.dart';

abstract class DebugState extends Equatable {
  const DebugState();
}

class DebugInitial extends DebugState {
  @override
  List<Object> get props => [];
}
