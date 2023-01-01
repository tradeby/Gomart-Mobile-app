import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart';
import 'package:gomart/screens/Authentication/Login/bloc/login_cubit.dart';
import 'package:gomart/screens/Authentication/Register/bloc/registration_cubit.dart';
import 'package:gomart/screens/Authentication/authentication_screen.dart';
import 'package:gomart/screens/Home/Screens/Home/bloc/home_cubit.dart';
import 'package:gomart/screens/Search/bloc/search_cubit.dart';
import 'package:gomart/screens/debug/bloc/debug_cubit.dart';
import 'package:gomart/styles/styles.dart';
import 'package:gomart/service/bloc_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'injection.dart';

Future<void> main() async {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  Bloc.observer = BlocDelegateObserver();
  await configureDependencies();

  runApp(
    Phoenix(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) =>
                locator<AuthenticationBloc>()..add(AuthenticationStarted()),
          ),
          BlocProvider<RegistrationCubit>(
            create: (context) => locator<RegistrationCubit>(),
          ),
          BlocProvider<LoginCubit>(
            create: (context) => locator<LoginCubit>()..checkForPreviousPhoneNumber(),
          ),
          BlocProvider<DebugCubit>(
            create: (context) => locator<DebugCubit>(),
          ),
          BlocProvider<HomeCubit>(
            create: (context) => locator<HomeCubit>()..loadHomeProducts(),
          ),
          BlocProvider<SearchCubit>(
            create: (context) => locator<SearchCubit>(),
          )
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
      debugShowCheckedModeBanner: false,
      title: 'Gomart app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:  SystemUiOverlayStyle.light,
        ),
      ),
      home: const Authentication(),
    );
  }
}
