import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart';
import 'package:gomart/screens/Authentication/authentication_screen.dart';
import 'package:gomart/screens/styles.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'injection.dart';

Future<void> main() async {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(
    Phoenix(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) =>locator<AuthenticationBloc>()
              ..add(AuthenticationStarted()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gomart app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Authentication(),
    );
  }
}
