import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomart/screens/Authentication/Login/otp_code_screen.dart';
import 'package:gomart/screens/Authentication/Register/register_screen_upload_photo.dart';
import 'package:gomart/screens/styles.dart';

class RegisterScreenAddBasicInfo extends StatelessWidget {
  const RegisterScreenAddBasicInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.28,
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
            const Text('Basic Information',
                style: TextStyle(color: Styles.colorTextDark)),
            const Padding(padding: EdgeInsets.all(8)),
            const CustomInput(label: 'First name'),
            const Padding(padding: EdgeInsets.all(8)),
            const CustomInput(label: 'Last name'),
            const Padding(padding: EdgeInsets.all(8)),
            const CustomInput(label: 'Date of birth'),
            const Padding(padding: EdgeInsets.all(8)),
            const Padding(padding: EdgeInsets.all(16)),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Styles.colorSecondary,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreenUploadPhoto()),
                );
              },
              child: const Text(
                'Next',
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: Styles.colorBlack),
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

  const CustomInput({Key? key, required this.label}) : super(key: key);

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
          hintText: label,
        ),
      ),
    );
  }
}
