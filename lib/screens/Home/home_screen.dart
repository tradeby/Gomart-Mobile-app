import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../data/bloc/authentication/authentication_bloc.dart';
import '../../styles/custom_home_icons.dart';
import '../Authentication/Register/register_screen_upload_photo.dart';
import '../../styles/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        selectedFontSize: 12,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Styles.colorTextDark,
        selectedItemColor: Styles.colorTextDark,
        items: const [
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(9),
                child: Icon(
                  Gomart.home,
                  color: Styles.colorTextDark,
                ),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Gomart.heart,
                  color: Styles.colorBlack,
                ),
              ),
              label: 'Saved'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Gomart.wallet,
                  color: Styles.colorBlack,
                ),
              ),
              label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Gomart.message,
                  color: Styles.colorBlack,
                ),
              ),
              label: 'Message'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Gomart.profile,
                  color: Styles.colorBlack,
                ),
              ),
              label: 'Account'),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Test Home screen',
            ),
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
                        (FirebaseAuth.instance.currentUser?.photoURL != null)
                            ? CircleAvatar(
                                radius: 45,
                                child: ClipOval(
                                    child: Image.network(
                                  FirebaseAuth.instance.currentUser?.photoURL
                                      as String,
                                  width: 120,
                                )),
                              )
                            : CharacterAvatar(
                                ch: FirebaseAuth
                                        .instance.currentUser?.displayName ??
                                    'Null',
                              ),
                        const Padding(padding: EdgeInsets.all(12)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${FirebaseAuth.instance.currentUser?.displayName}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            const Padding(padding: EdgeInsets.all(2)),
                            Text(
                              '${FirebaseAuth.instance.currentUser?.phoneNumber}',
                              style: const TextStyle(
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
            const Padding(padding: EdgeInsets.all(50)),
            ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Styles.colorPrimary,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  HapticFeedback.vibrate();
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLoggedOut(context));
                },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
