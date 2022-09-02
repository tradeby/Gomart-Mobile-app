import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart';
import 'package:gomart/injection.dart';
import 'package:gomart/screens/Authentication/Register/register_screen_upload_photo.dart';
import 'package:gomart/screens/styles.dart';

class RegisterOtpCodeScreen extends StatelessWidget {
  const RegisterOtpCodeScreen({
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: <Widget>[
                        const CharacterAvatar(
                          ch: 'Shams',
                        ),
                        const Padding(padding: EdgeInsets.all(12)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              'Salisu Musa Jahun',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                            Text(
                              '08093446914',
                              style: TextStyle(
                                  fontSize: 14, color: Styles.colorTextDark),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(16)),
            const Text('Enter the otp code we just texted you',
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
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLoggedIn());
              },
              child: const Text(
                'Get started',
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
