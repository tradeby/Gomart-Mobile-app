import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart';
import 'package:gomart/screens/debug/bloc/debug_cubit.dart';
import 'package:gomart/screens/debug/debug_algolia_results.dart';
import 'package:gomart/styles/custom_home_icons.dart';

import '../../../../styles/styles.dart';
import '../../../Authentication/Register/register_screen_upload_photo.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.settings)),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: <Widget>[
                        (FirebaseAuth.instance.currentUser?.photoURL != null)
                            ? CircleAvatar(
                                radius: 30,
                                child: ClipOval(
                                    child: Image.network(
                                  FirebaseAuth.instance.currentUser?.photoURL
                                      as String,
                                  width:60,
                                )),
                              )
                            : CharacterAvatar(
                                ch: FirebaseAuth
                                        .instance.currentUser?.displayName ??
                                    'Null',
                              ),
                        const Padding(padding: EdgeInsets.all(8)),
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
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:  [
                             OutlinedButton(onPressed: (){},
                               style: OutlinedButton.styleFrom(
                                 shape: const StadiumBorder(),
                               ), child:  const Text('Edit',
                               style: TextStyle(
                                 color: Styles.colorTextBlack
                               ),),)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Styles.colorSecondary,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                ),
                elevation: 0
              ),
              onPressed: (){},
              child: const Text(
                'Start selling',
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: Styles.colorBlack),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Container(
              color: Styles.colorWhite,
              height: MediaQuery.of(context).size.height *0.3,
              child:    ListView(children: const [
                ListTile(leading: Icon(Gomart.accountHelpCenterIcon, color: Styles.colorBlack,), title: Text('Help Center')),
                ListTile(leading: Icon(Gomart.accountAppFeedbackIcon, color: Styles.colorBlack), title: Text('App Feedback')),
                ListTile(leading: Icon(Gomart.accountGomartIcon, color: Styles.colorBlack), title: Text('About Gomart')),
                ListTile(leading: Icon(Gomart.accountLogoutIcon, color: Styles.colorBlack), title: Text('Logout'))
              ]),
            ),
            const Padding(padding: EdgeInsets.all(50)),
            (kDebugMode && false)
                ? ElevatedButton(
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
                child: const Text('Logout')):Container(),
            (kDebugMode && false)
                ? ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Styles.colorPrimary,
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DebugAlgoliaSearchScreen(),
                        ),
                      );
                    },
                    child: const Text('Debug algolia page'))
                : Container(),
            (kDebugMode && false)
                ? ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Styles.colorPrimary,
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      context.read<DebugCubit>().seedSampleProducts();
                    },
                    child: const Text('Debug seed sample data'))
                : Container()
          ],
        ),
      ),
    );
  }
}
