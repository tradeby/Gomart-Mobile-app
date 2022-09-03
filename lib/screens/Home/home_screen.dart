import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../data/bloc/authentication/authentication_bloc.dart';
import '../styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Home screen',
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
                  context.read<AuthenticationBloc>()
                      .add(AuthenticationLoggedOut(context));
                  Phoenix.rebirth(context);

                },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
