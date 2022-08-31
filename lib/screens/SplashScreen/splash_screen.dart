import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorPrimary,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AnimatedContainer(
                padding: EdgeInsets.fromLTRB(
                    0,
                         MediaQuery.of(context).size.height * 0.237,
                    0,
                    0),
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  'assets/icon/gomart-logo-with-text.png',
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
