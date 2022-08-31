import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart';
import 'package:gomart/injection.dart';
import 'package:gomart/screens/styles.dart';

class OtpCodeScreen extends StatelessWidget {
  const OtpCodeScreen({
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
            ),
            const Padding(padding: EdgeInsets.all(16)),
            const Text('Enter the OTP code we just texted you',
                style: TextStyle(color: Styles.colorTextDark, fontSize: 16)),
            const Padding(padding: EdgeInsets.all(12)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 35,
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
                    fontWeight: FontWeight.normal, color: Styles.colorTextDark),
              ),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Styles.colorSecondary,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                locator<AuthenticationBloc>().add(AuthenticationLoggedIn());
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
