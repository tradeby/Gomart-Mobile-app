import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gomart/screens/Home/Screens/HomeFragment/home_Fragment.dart';
import 'package:gomart/screens/Home/Screens/message.dart';
import 'package:gomart/screens/Home/Screens/saved.dart';
import 'package:gomart/screens/Home/Screens/profile.dart';
import 'package:gomart/screens/Home/Screens/HomeFragment/home_Fragment.dart';

import '../../data/bloc/authentication/authentication_bloc.dart';
import '../../styles/custom_home_icons.dart';
import '../Authentication/Register/register_screen_upload_photo.dart';
import '../../styles/styles.dart';
import 'Screens/profile.dart';
import 'Screens/wallet.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (currentIndex) => setState(() {
          currentPage = currentIndex;
        }),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPage,
        selectedFontSize: 12,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Styles.colorTextDark,
        selectedItemColor: Styles.colorTextDark,
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(9),
                child: Icon(
                 currentPage ==0?Gomart.homeHover: Gomart.home,
                  color: Styles.colorTextDark,
                ),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Padding(
                padding:const  EdgeInsets.all(8.0),
                child: Icon(
                  currentPage ==1?Gomart.heartHover: Gomart.heart,
                  color: Styles.colorBlack,
                ),
              ),
              label: 'Saved'),
          BottomNavigationBarItem(
              icon: Padding(
                padding:const EdgeInsets.all(8.0),
                child: Icon(
                  currentPage ==2?Gomart.walletHover:  Gomart.wallet,
                  color: Styles.colorBlack,
                ),
              ),
              label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  currentPage ==3?Gomart.messageHover: Gomart.message,
                  color: Styles.colorBlack,
                ),
              ),
              label: 'Message'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  currentPage ==4?Gomart.profileHover: Gomart.profile,
                  color: Styles.colorBlack,
                ),
              ),
              label: 'Account'),
        ],
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
