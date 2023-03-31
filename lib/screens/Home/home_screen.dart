import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gomart/screens/Home/Screens/Home/home.dart';
import 'package:gomart/screens/Home/Screens/Messages/message.dart';
import 'package:gomart/screens/Home/Screens/Saved/saved.dart';
import 'package:gomart/screens/Home/Screens/Account/profile.dart';
import 'package:gomart/screens/Home/Screens/Home/home.dart';

import '../../data/bloc/authentication/authentication_bloc.dart';
import '../../styles/custom_home_icons.dart';
import '../Authentication/Register/register_screen_upload_photo.dart';
import '../../styles/styles.dart';
import 'Screens/Account/profile.dart';
import 'Screens/Wallet/wallet.dart';

class SampleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateSampleWidget();

}

class StateSampleWidget extends State<SampleWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Text('Hello world sample shit'),
          ),
        )
    );
  }

}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateHomeScreen();
}

class StateHomeScreen extends State<HomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            systemNavigationBarColor: Styles.colorWhite, // navigation bar color
            statusBarColor:Styles.colorWhite, // status bar color
            statusBarIconBrightness:Brightness.dark,// status bar icons' color
            systemNavigationBarIconBrightness:Brightness.dark, //navigation bar icons' color
          ),
        child: BottomNavigationBar(
          onTap: (currentIndex) =>
              setState(() {
                currentPage = currentIndex;
              }),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPage,
          selectedFontSize: 12,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Styles.colorTextDark,
          selectedItemColor: Styles.colorPrimary,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(9),
                  child: Icon( Gomart.home,
                    color: currentPage == 0 ?Styles.colorPrimary: Styles.colorBlack,
                  ),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Gomart.heart,
                    color: currentPage == 1 ?Styles.colorPrimary: Styles.colorBlack,
                  ),
                ),
                label: 'Saved'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon( Gomart.wallet,
                    color: currentPage == 2 ?Styles.colorPrimary: Styles.colorBlack,
                  ),
                ),
                label: 'Wallet'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon( Gomart.message,
                    color: currentPage == 3 ?Styles.colorPrimary: Styles.colorBlack,
                  ),
                ),
                label: 'Message'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon( Gomart.profile,
                    color: currentPage == 4 ?Styles.colorPrimary: Styles.colorBlack,
                  ),
                ),
                label: 'Account'),
          ],
        ),
      ),
      body: _currentPage(),
    );
  }

  _currentPage() {
    switch (currentPage) {
      case 0:
        return const HomeFragment();
      case 1:
        return const SavedFragment();
      case 2:
        return const WalletFragment();
      case 3:
        return const MessageFragment();
      case 4:
        return const ProfileFragment();
      default:
        return const Center(child: Text('Error encountered'));
    }
  }
}
