import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart';
import 'package:gomart/screens/Authentication/GetStarted/get_started_screen.dart';
import 'package:gomart/screens/Authentication/Login/login_screen.dart';
import 'package:gomart/screens/Authentication/Login/otp_code_screen.dart';
import 'package:gomart/screens/Authentication/Register/register_screen.dart';
import 'package:gomart/screens/Authentication/Register/register_screen_basic_info.dart';
import 'package:gomart/screens/Authentication/Register/register_screen_otp_code.dart';
import 'package:gomart/screens/Authentication/Register/register_screen_upload_photo.dart';
import 'package:gomart/screens/routes.dart';

import 'Login/bloc/login_cubit.dart';
import 'Register/bloc/registration_cubit.dart';

class AuthenticationFlow extends StatefulWidget {
  const AuthenticationFlow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateAuthenticationFlow();
}

class StateAuthenticationFlow extends State<AuthenticationFlow> {
  int firstBackButton = 0;
  final _navigatorKey = GlobalKey<NavigatorState>();

  void _onRegisterPressed() {
    _navigatorKey.currentState!.pushNamed(routeRegister);
    setState(() {
      firstBackButton = 0;
    });
  }

  void _onLoginPressed() {

    _navigatorKey.currentState!.pushNamed(routeLogin);
    setState(() {
      firstBackButton = 0;
    });
  }

  void _onLoginOtp() {
    context.read<LoginCubit>().verifyPhoneNumber();
    _navigatorKey.currentState!.pushNamed(routeLoginOtp);
    setState(() {
      firstBackButton = 0;
    });
  }

  void _onRegisterBasicInfo() {
    _navigatorKey.currentState!.pushNamed(routeRegisterBasicInfo);
    setState(() {
      firstBackButton = 0;
    });
  }

  void _onRegisterUploadPhotoPressed() {
    _navigatorKey.currentState!.pushNamed(routeRegisterUploadPhoto);
    setState(() {
      firstBackButton = 0;
    });
  }

  void _onRegisterOtp() {
    context.read<RegistrationCubit>().verifyPhoneNumber();
    _navigatorKey.currentState!.pushNamed(routeRegisterOtp);
    setState(() {
      firstBackButton = 0;
    });
  }

  Future<bool> _onBackButtonPressed() async {
    setState(() {
      firstBackButton = firstBackButton + 1;
    });
    if (firstBackButton > 1) {
      return Platform.isIOS ? false : true;
    } else {
      _navigatorKey.currentState!.pushNamed(routeGettingStarted);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<LoginCubit>().checkForPreviousPhoneNumber();
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackButtonPressed,
        child: Navigator(
          key: _navigatorKey,
          initialRoute: routeGettingStarted,
          onGenerateRoute: _onGenerateRoute,
        ),
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case routeGettingStarted:
        page = GetStartedScreen(
            onLoginPressed: _onLoginPressed,
            onRegisterPressed:
                _onRegisterPressed); //onPressed, resolve either login or register
        break;
      case routeLogin:
        page = LoginScreen(onLoginOtpPressed: _onLoginOtp);
        break;
      case routeLoginOtp:
        page = const LoginOtpCodeScreen(); //done too
        break;
      case routeRegister:
        page = RegisterScreen(onRegisterBasicInfoPressed: _onRegisterBasicInfo);
        break;
      case routeRegisterBasicInfo:
        page = RegisterScreenAddBasicInfo(
            onRegisterUploadPhotoPressed: _onRegisterUploadPhotoPressed);
        break;
      case routeRegisterUploadPhoto:
        page = RegisterScreenUploadPhoto(onRegisterOtpPressed: _onRegisterOtp);
        break;
      case routeRegisterOtp:
        page = const RegisterOtpCodeScreen();
        break;
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}
