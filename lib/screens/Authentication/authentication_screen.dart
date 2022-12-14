import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart';
import 'package:gomart/screens/Authentication/GetStarted/get_started_screen.dart';
import 'package:gomart/screens/Authentication/Login/login_screen.dart';
import 'package:gomart/screens/Authentication/authentication_flow.dart';
import 'package:gomart/screens/SplashScreen/splash_screen.dart';

import '../Home/home_screen.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (kDebugMode) {
          print('This is a change of state $state');
        }
        if (state is AuthenticationLoggedOut) {
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, authState) {
          if (authState is AuthenticationInitial) {
            return const SplashScreen();
          }
          if (authState is AuthenticationFailure) {
            if (kDebugMode) {
              print('in getting started');
            }

            return  const AuthenticationFlow();
          }
          if (authState is AuthenticationSuccess) {
            if (kDebugMode) {
              print('Authentication success works!!!!!!!!!!!!!');
            }
            return const HomeScreen();
            //return const LoginScreen();
          } else {
            return const AuthenticationFlow();
          }
        },
      ),
    );
  }
}
