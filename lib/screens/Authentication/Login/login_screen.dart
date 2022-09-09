import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/screens/Authentication/Login/bloc/login_cubit.dart';
import 'package:gomart/screens/Authentication/Login/bloc/login_cubit.dart';
import 'package:gomart/screens/Authentication/Login/bloc/login_state.dart';
import 'package:gomart/screens/Authentication/Login/otp_code_screen.dart';
import 'package:gomart/screens/styles.dart';

import '../Register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Styles.colorPrimary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Welcome back',
                      style: TextStyle(color: Styles.colorWhite, fontSize: 18),
                    ),
                    const Padding(padding: EdgeInsets.all(16)),
                    Image.asset(
                      'assets/icon/gomart-logo-with-text.png',
                      width: 200,
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(16)),
              const Text('Sign in with your phone number',
                  style: TextStyle(color: Styles.colorTextDark)),
              const Padding(padding: EdgeInsets.all(8)),
              PhoneNumberInput(
                onPhoneNumberChanged: (text) {
                  context.read<LoginCubit>().setPhoneNumber(text);
                },
                onCountryChanged: (selectedCountry) {
                  context.read<LoginCubit>().setFlagCountryCode(selectedCountry);
                },
              ),
              const Padding(padding: EdgeInsets.all(8)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const Text(
                  'By entering your phone number, you agree to our '
                  'Terms and Condition',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Styles.colorTextDark,
                    fontSize: 12,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(16)),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Styles.colorSecondary,
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: (state.phoneNumber == null)
                        ? () {
                            const snackBar = SnackBar(
                              content: Text('Please enter a phone number'),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        : () {
                      context.read<LoginCubit>().verifyPhoneNumber();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OtpCodeScreen()),
                            );
                          },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Styles.colorBlack),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
