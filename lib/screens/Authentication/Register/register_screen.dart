import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/data/model/FlagCountryCode/flag_country_code.dart';
import 'package:gomart/screens/Authentication/Register/bloc/register_state.dart';
import 'package:gomart/screens/Authentication/Register/bloc/registration_cubit.dart';
import 'package:gomart/screens/Authentication/Register/register_screen_basic_info.dart';
import 'package:gomart/screens/styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
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
                      const Padding(padding: EdgeInsets.all(16)),
                      Image.asset(
                        'assets/icon/gomart-logo-with-text.png',
                        width: 200,
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(16)),
                const Text('Sign up with your phone number',
                    style: TextStyle(color: Styles.colorTextDark)),
                const Padding(padding: EdgeInsets.all(8)),
                PhoneNumberInput(
                  onPhoneNumberChanged: (text) {
                    context.read<RegistrationCubit>().setPhoneNumber(text);
                  },
                  onCountryChanged: (selectedCountry) {
                    context
                        .read<RegistrationCubit>()
                        .setFlagCountryCode(selectedCountry);
                  },
                ),
                const Padding(padding: EdgeInsets.all(8)),
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
                BlocBuilder<RegistrationCubit, RegisterState>(
                  builder: (context, state) {
                    return TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Styles.colorSecondary,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 40),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: (state.phoneNumber == null)
                          ? () {
                              const snackBar = SnackBar(
                                content: Text('Please enter a phone number'),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreenAddBasicInfo()),
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
      ),
    );
  }
}

class PhoneNumberInput extends StatelessWidget {
  final ValueChanged<String>? onPhoneNumberChanged;
  final ValueChanged<FlagCountryCodeModel?>? onCountryChanged;

  const PhoneNumberInput(
      {Key? key,
      required this.onPhoneNumberChanged,
      required this.onCountryChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegisterState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.68,
          height: 40,
          decoration: BoxDecoration(
            color: Styles.colorWhite,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButton(
                    value: state.selectedCountry ??
                        FlagCountryCodeModel.getSupportedList[0],
                    underline: Container(),
                    items: List.generate(
                        FlagCountryCodeModel.getSupportedList.length,
                        (index) => DropdownMenuItem(
                              value:
                                  FlagCountryCodeModel.getSupportedList[index],
                              child: FlagCountryCode(
                                model: FlagCountryCodeModel
                                    .getSupportedList[index],
                              ),
                            )).toList(),
                    onChanged: onCountryChanged),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: VerticalDivider(),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      onChanged: onPhoneNumberChanged,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        hintText: 'Phone number',
                        fillColor: Styles.colorWhite,
                        filled: true,
                        focusColor: Styles.colorWhite,
                        hoverColor: Styles.colorWhite,
                        contentPadding: EdgeInsets.fromLTRB(4, 8, 0, 0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FlagCountryCode extends StatelessWidget {
  final FlagCountryCodeModel model;

  const FlagCountryCode({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(model.flag, width: 20),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
          Text(
            model.countryCode,
            style: const TextStyle(color: Styles.colorTextDark, fontSize: 12),
          ),
        ]);
  }
}

@Deprecated("We won't use this anymore, this will soon be removed ")
class PhoneNumberTextInput extends StatelessWidget {
  const PhoneNumberTextInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 40,
      child: TextField(
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
          hintText: 'Phone number',
        ),
      ),
    );
  }
}
