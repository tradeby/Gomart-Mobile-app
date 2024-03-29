import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gomart/screens/Authentication/Login/login_screen.dart';
import 'package:gomart/screens/Authentication/Register/register_screen.dart';
import 'package:gomart/styles/styles.dart';

class GetStartedScreen extends StatefulWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onRegisterPressed;
  const GetStartedScreen({
    Key? key, required this.onLoginPressed, required this.onRegisterPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateGetStartedScreen();
}

class StateGetStartedScreen extends State<GetStartedScreen> {
  bool startAnimation = false;
  Widget _myAnimatedWidget = Container();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 800))
        .then((value) => setState(() => {
              startAnimation = true,
            }));

    Future.delayed(const Duration(milliseconds: 960)).then(
        (value) => setState(() => {_myAnimatedWidget = _buttonsColumn()}));
    super.initState();
  }

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
                curve: Curves.easeOut,
                padding: EdgeInsets.fromLTRB(
                    0,
                    startAnimation
                        ? MediaQuery.of(context).size.height * 0.18
                        : MediaQuery.of(context).size.height * 0.237,
                    0,
                    0),
                duration: const Duration(milliseconds: 300),
                child: SvgPicture.asset(
                    'assets/icon/splash_svg.svg',
                    semanticsLabel: 'Gomart Logo'
                )
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _myAnimatedWidget,
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _buttonsColumn() {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Styles.colorSecondary,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            shape: const StadiumBorder(),
          ),
          onPressed: widget.onRegisterPressed,
          child: const Text(
            'Sign up',
            style: TextStyle(
                fontWeight: FontWeight.normal, color: Styles.colorBlack),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            shape: const StadiumBorder(),
          ),
          onPressed: widget.onLoginPressed,
          child: const Text(
            'Log in',
            style: TextStyle(
                fontWeight: FontWeight.normal, color: Styles.colorWhite),
          ),
        ),
      ],
    );
  }
}
