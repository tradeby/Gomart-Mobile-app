import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart';
import 'package:gomart/screens/Home/Screens/Account/settings.dart';
import 'package:gomart/screens/debug/bloc/debug_cubit.dart';
import 'package:gomart/screens/debug/debug_algolia_results.dart';
import 'package:gomart/screens/debug/get_location_screen.dart';
import 'package:gomart/styles/custom_home_icons.dart';

import '../../../../styles/styles.dart';
import '../../../Authentication/Register/register_screen_upload_photo.dart';
import 'BusinessProfile/_business_profile_loading_screen.dart';
import 'BusinessProfile/business_profile_screen.dart';
import 'EditBusiness/edit_business_screen.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('USERS')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const BusinessProfileLoading();
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text('No data found.'),
            );
          }
          final userData = snapshot.data!.data()!;
          try {
            String? businessId = snapshot.data?.get('businessId');

            if (businessId != null) {
              return BusinessProfileScreen(businessId: businessId);
            } else {
              return const ProfileSettingsScreen();
            }
          } catch (e) {
            return const ProfileSettingsScreen();
          }
        },
      ),
      /*body: SettingsAccountScreen(),*/
    );
  }
}

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Styles.colorWhite,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                                  width: 60,
                                )),
                              )
                            : CharacterAvatar(
                                heightWidth: 30,
                                ch: FirebaseAuth
                                        .instance.currentUser?.displayName ??
                                    'Null',
                              ),
                        const Padding(padding: EdgeInsets.all(4)),
                        Text(
                          '${FirebaseAuth.instance.currentUser?.displayName}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LocationScreen()),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  'Settings',
                                  style:
                                      TextStyle(color: Styles.colorTextBlack),
                                ),
                                Padding(padding: EdgeInsets.all(4)),
                                Icon(Icons.settings)
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            /*   Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              ],
            ),*/
            /*    Container(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              width: MediaQuery.of(context).size.width,
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
                                radius: 30,
                                child: ClipOval(
                                    child: Image.network(
                                  FirebaseAuth.instance.currentUser?.photoURL
                                      as String,
                                  width: 60,
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
                            children: [
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  'Edit',
                                  style:
                                      TextStyle(color: Styles.colorTextBlack),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
           ,*/
            const Padding(padding: EdgeInsets.all(5)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.94,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Styles.colorSecondary,
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditBusinessScreen()),
                  );
                },
                child: const Text(
                  'Start selling on Gomart',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Styles.colorBlack),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Container(
              color: Styles.colorWhite,
              child: Column(children: [
                ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Gomart.accountHelpCenterIcon,
                      color: Styles.colorBlack,
                    ),
                    title: const Text('Help Center')),
                ListTile(
                    onTap: () {},
                    leading: const Icon(Gomart.accountAppFeedbackIcon,
                        color: Styles.colorBlack),
                    title: const Text('App Feedback')),
                ListTile(
                    onTap: () {},
                    leading: const Icon(Gomart.accountGomartIcon,
                        color: Styles.colorBlack),
                    title: const Text('About Gomart')),
                ListTile(
                    onTap: () {},
                    leading: const Icon(Gomart.accountLogoutIcon,
                        color: Styles.colorBlack),
                    title: const Text('Logout'))
              ]),
            ),
            const Padding(padding: EdgeInsets.all(50)),
            (kDebugMode && false)
                ? ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Styles.colorPrimary,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 40),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      HapticFeedback.vibrate();
                      context
                          .read<AuthenticationBloc>()
                          .add(AuthenticationLoggedOut(context));
                    },
                    child: const Text('Logout'))
                : Container(),
            (kDebugMode && false)
                ? ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Styles.colorPrimary,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 40),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DebugAlgoliaSearchScreen(),
                        ),
                      );
                    },
                    child: const Text('Debug algolia page'))
                : Container(),
            (kDebugMode && false)
                ? ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Styles.colorPrimary,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 40),
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
