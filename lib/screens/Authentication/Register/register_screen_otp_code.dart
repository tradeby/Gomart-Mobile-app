import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart';
import 'package:gomart/injection.dart';
import 'package:gomart/screens/Authentication/Register/bloc/registration_cubit.dart';
import 'package:gomart/screens/Authentication/Register/bloc/registration_cubit.dart';
import 'package:gomart/screens/Authentication/Register/register_screen_upload_photo.dart';
import 'package:gomart/screens/styles.dart';

import 'bloc/register_state.dart';

class RegisterOtpCodeScreen extends StatelessWidget {
  const RegisterOtpCodeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      body: BlocListener<RegistrationCubit, RegisterState>(
        listener: (context, state) {
          if (state.registrationSuccessful != null) {
            if (state.registrationSuccessful == true) {
              context.read<AuthenticationBloc>().add(AuthenticationLoggedIn());
            }
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.28,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: <Widget>[
                          BlocBuilder<RegistrationCubit, RegisterState>(
                            builder: (context, state) {
                              return (state.photoUrl != null)
                                  ? CircleAvatar(
                                      radius: 45,
                                      child: ClipOval(
                                          child: Image.file(
                                        File(state.photoUrl.toString()),
                                        width: 120,
                                      )),
                                    )
                                  : CharacterAvatar(
                                      ch: state.firstName ?? 'Null',
                                    );
                            },
                          ),
                          const Padding(padding: EdgeInsets.all(12)),
                          BlocBuilder<RegistrationCubit, RegisterState>(
                            builder: (context, state) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${state.firstName.toString()} ${state.lastName.toString()}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Padding(padding: EdgeInsets.all(2)),
                                  Text(
                                    '${state.selectedCountry?.countryCode ?? '+234'} ${state.phoneNumber}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Styles.colorTextDark),
                                  )
                                ],
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(16)),
              const Text('Enter the OTP code we just texted you',
                  style: TextStyle(color: Styles.colorTextDark, fontSize: 16)),
              const Padding(padding: EdgeInsets.all(12)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 35,
                child: TextField(
                  onChanged: (text) =>
                      context.read<RegistrationCubit>().setOtpCode(text),
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontSize: 14),
                  cursorColor: Styles.colorPrimary,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: Styles.colorWhite,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
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
              BlocBuilder<RegistrationCubit, RegisterState>(
                builder: (context, state) {
                  if (state.registrationSuccessful != null &&
                      state.registrationSuccessful == false) {
                    return Text('Error ${state.status?.toString()}');
                  } else {
                    return Container();
                  }
                },
              ),
              const Padding(padding: EdgeInsets.all(8)),
              BlocBuilder<RegistrationCubit, RegisterState>(
                builder: (context, state) {
                  return TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          (state.verificationId == null || state.otp == null)
                              ? Styles.colorSecondary.withOpacity(0.4)
                              : Styles.colorSecondary,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 40),
                      shape: const StadiumBorder(),
                    ),
                    onPressed:
                        (state.verificationId == null || state.otp == null)
                            ? null
                            : () {
                                context
                                    .read<RegistrationCubit>()
                                    .prepareCredentialAndLogin();
                              },
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color:
                            (state.verificationId == null || state.otp == null)
                                ? Styles.colorBlack.withOpacity(0.6)
                                : Styles.colorBlack,
                      ),
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
