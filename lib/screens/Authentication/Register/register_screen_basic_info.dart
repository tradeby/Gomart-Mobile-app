import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomart/screens/Authentication/Register/bloc/register_state.dart';
import 'package:gomart/screens/Authentication/Register/register_screen_upload_photo.dart';
import 'package:gomart/styles/styles.dart';

import 'bloc/registration_cubit.dart';

class RegisterScreenAddBasicInfo extends StatelessWidget {
  final VoidCallback onRegisterUploadPhotoPressed;
  const RegisterScreenAddBasicInfo({
    Key? key, required this.onRegisterUploadPhotoPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      body: SingleChildScrollView(
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
                      'Find shops & services near you',
                      style: TextStyle(color: Styles.colorWhite, fontSize: 18),
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    SvgPicture.asset(
                        'assets/icon/splash_svg.svg',
                        height: 80,
                        semanticsLabel: 'Gomart Logo'
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(16)),
              const Text('Basic Information',
                  style: TextStyle(color: Styles.colorTextDark)),
              const Padding(padding: EdgeInsets.all(8)),
              CustomInput(
                label: 'First name',
                onChanged: (text) {
                  context.read<RegistrationCubit>().setFirstName(text);
                },
              ),
              const Padding(padding: EdgeInsets.all(8)),
              CustomInput(
                  label: 'Last name',
                  onChanged: (text) {
                    context.read<RegistrationCubit>().setLastName(text);
                  }),
              // const Padding(padding: EdgeInsets.all(12)),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.6,
              //   child: const Text(
              //       'Your Date of birth, so we can wish you happy birthdays',
              //       textAlign: TextAlign.center,
              //       style:
              //           TextStyle(color: Styles.colorTextDark, fontSize: 12)),
              // ),
              // const Padding(padding: EdgeInsets.all(4)),
              // GestureDetector(
              //   onTap: (Platform.isIOS)
              //       ? () {
              //           showModalBottomSheet<void>(
              //             context: context,
              //             builder: (BuildContext context) {
              //               return const SelectDateOfBirthIos();
              //             },
              //           );
              //         }
              //       : () async {
              //           await showDatePicker(
              //             context: context,
              //             initialDate: DateTime.now(),
              //             firstDate: DateTime(1900),
              //             lastDate: DateTime.now(),
              //           ).then((date) => {
              //                 if (date != null)
              //                   context
              //                       .read<RegistrationCubit>()
              //                       .setDateOfBirth(date)
              //               });
              //         },
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.6,
              //     height: 40,
              //     decoration: BoxDecoration(
              //         color: Styles.colorWhite,
              //         borderRadius: BorderRadius.circular(20)),
              //     child: Center(
              //         child: BlocBuilder<RegistrationCubit, RegisterState>(
              //       builder: (context, state) {
              //         return Text(
              //           (state.dateOfBirth != null) ?
              //           '${state.dateOfBirth?.day}/${state.dateOfBirth?.month}/${state.dateOfBirth?.year}'
              //               : 'Date of birth',
              //           style: const TextStyle(color: Styles.colorTextDark),
              //         );
              //       },
              //     )),
              //   ),
              // ),
              // const Padding(padding: EdgeInsets.all(8)),
              const Padding(padding: EdgeInsets.all(16)),
              BlocBuilder<RegistrationCubit, RegisterState>(
                builder: (context, state) {
                  return TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Styles.colorSecondary,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 40),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: (state.firstName != null &&
                            state.lastName != null)
                        ? onRegisterUploadPhotoPressed: () {
                            const snackBar = SnackBar(
                              content:
                                  Text('First name & Last name are required'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
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

class SelectDateOfBirthIos extends StatefulWidget {
  const SelectDateOfBirthIos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateSelectDateOfBirthIos();
}

class StateSelectDateOfBirthIos extends State<SelectDateOfBirthIos> {
  DateTime selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                maximumDate: DateTime.now(),
                onDateTimeChanged: (dateTime) {
                  setState(() {
                    selectedDateTime = dateTime;
                  });
                },
              ),
            ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Styles.colorSecondary,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  context
                      .read<RegistrationCubit>()
                      .setDateOfBirth(selectedDateTime);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Styles.colorBlack),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;

  const CustomInput({Key? key, required this.label, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 40,
      child: TextField(
        onChanged: onChanged,
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
          hintText: label,
        ),
      ),
    );
  }
}
