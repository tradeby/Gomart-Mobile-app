import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gomart/data/repository/User/IUserRepository.dart';
import 'package:injectable/injectable.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IUserRepository _userRepository;

  AuthenticationBloc(this._userRepository) : super(AuthenticationInitial()) {
    on<AuthenticationStarted>((event, emit) async {
      final isSignedIn = _userRepository.isSignedIn();
      if (isSignedIn) {
        emit(AuthenticationSuccess());
      } else {
        emit(AuthenticationFailure());
      }
    });

    on<AuthenticationLoggedIn>((event, emit) async {
      try {
        final isSignedIn = _userRepository.isSignedIn();
        if (isSignedIn) {
          emit(AuthenticationSuccess());
        } else {
          emit(AuthenticationFailure());
        }
      } catch (e) {
        emit(AuthenticationFailure());
      }
    });

    on<AuthenticationLoggedOut>((event, emit) async {
      await _userRepository.signOut();
      emit(AuthenticationFailure());
      Phoenix.rebirth(event.context);

    });
  }
}
