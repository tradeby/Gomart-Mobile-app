import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomart/screens/Authentication/Login/otp_code_screen.dart';
import 'package:gomart/screens/Authentication/Register/register_screen_otp_code.dart';
import 'package:gomart/screens/Home/home_screen.dart';
import 'package:gomart/screens/styles.dart';

class RegisterScreenUploadPhoto extends StatelessWidget {
  const RegisterScreenUploadPhoto({
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
            const Text('Profile photo',
                style: TextStyle(color: Styles.colorTextDark)),
            const Padding(padding: EdgeInsets.all(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                IconButtonWithText(
                  icon: Icons.camera_alt,
                  label: 'Use camera',
                ),
                IconButtonWithText(
                  icon: Icons.cloud_upload,
                  label: 'Upload photo',
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(8)),
            const Text('Or click skip to use this instead',
                style: TextStyle(color: Styles.colorTextDark)),
            const Padding(padding: EdgeInsets.all(8)),
            const CharacterAvatar(ch: 'Shams',),
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
                  MaterialPageRoute(builder: (context) => const RegisterOtpCodeScreen()),
                );
              },
              child: const Text(
                'Skip',
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

class CharacterAvatar extends StatelessWidget {
  final String ch;
  const CharacterAvatar({
    Key? key,
    required this.ch
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Material(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(50),
        child:  Center(
          child: Text(
            ch[0],
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class IconButtonWithText extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconButtonWithText({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Styles.colorSecondary,
              padding: const EdgeInsets.all(12),
              shape: const CircleBorder(),
            ),
            onPressed: () {},
            child: Icon(icon)),
        const Padding(padding: EdgeInsets.all(4)),
        Text(label,
            style: const TextStyle(
              fontSize: 12,
              color: Styles.colorTextDark,
            )),
      ],
    );
  }
}
