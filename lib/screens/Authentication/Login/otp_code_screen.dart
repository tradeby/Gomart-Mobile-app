import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart';
import 'package:gomart/injection.dart';
import 'package:gomart/screens/Authentication/Login/bloc/login_cubit.dart';
import 'package:gomart/screens/Authentication/Login/bloc/login_state.dart';
import 'package:gomart/styles/styles.dart';

class LoginOtpCodeScreen extends StatelessWidget {
  const LoginOtpCodeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.loginSuccessful != null && state.loginSuccessful == true) {
          FocusManager.instance.primaryFocus?.unfocus();
          context.read<AuthenticationBloc>().add(AuthenticationLoggedIn());
          Navigator.of(context).pop();
        } else if (state.loginSuccessful != null &&
            state.loginSuccessful == false) {
          var snackBar = SnackBar(
            content: Text(state.status as String),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.28,
                  ),
                  const Padding(padding: EdgeInsets.all(16)),
                  const Text('Enter the OTP code we just texted you',
                      style:
                          TextStyle(color: Styles.colorTextDark, fontSize: 16)),
                  const Padding(padding: EdgeInsets.all(12)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 35,
                    child: TextField(
                      onChanged: (text) =>
                          context.read<LoginCubit>().setOtpCode(text),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(fontSize: 14),
                      cursorColor: Styles.colorPrimary,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: Styles.colorWhite,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        focusColor: Styles.colorWhite,
                        hoverColor: Styles.colorWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '* * * * * *',
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 40),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Resend code',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Styles.colorTextDark),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state.verificationId == null) {
                        return const Center(
                            child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Styles.colorPrimary),
                        ));
                      } else {
                        return TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: (state.verificationId == null ||
                                    state.otp == null)
                                ? Styles.colorSecondary.withOpacity(0.4)
                                : Styles.colorSecondary,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 40),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: (state.otp == null)
                              ? null
                              : () {
                                  var snackBar = SnackBar(
                                    content: Row(
                                      children: const [
                                        CircularProgressIndicator(),
                                        Text('Logging you in...'),
                                      ],
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  context
                                      .read<LoginCubit>()
                                      .prepareCredentialAndLogin();
                                },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: (state.verificationId == null ||
                                      state.otp == null)
                                  ? Styles.colorBlack.withOpacity(0.6)
                                  : Styles.colorBlack,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
