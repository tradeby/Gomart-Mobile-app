import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart';
import 'package:gomart/screens/Authentication/GetStarted/get_started_screen.dart';
import 'package:gomart/screens/Authentication/Login/login_screen.dart';
import 'package:gomart/screens/SplashScreen/splash_screen.dart';

import '../Home/home_screen.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
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
            return const GetStartedScreen();
          }
          if (authState is AuthenticationSuccess) {
            return const HomeScreen();
            //return const LoginScreen();
          } else {
            return const GetStartedScreen();
          }
        },
      ),
    );
  }
}