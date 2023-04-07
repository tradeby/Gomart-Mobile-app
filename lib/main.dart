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
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'injection.dart';

Future<void> main() async {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  Bloc.observer = BlocDelegateObserver();
  await configureDependencies();
  final client = StreamChatClient(
    'b67pax5b2wdq',
    logLevel: Level.INFO,
  );

  await client.connectUser(
    User(id: 'tutorial-flutter'),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c',
  );
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
        child: MyApp( client: client,),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,   required this.client,}) : super(key: key);
  final StreamChatClient client;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => StreamChat(
        client: client,
        child: child,
      ),
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
