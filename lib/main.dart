import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart';
import 'package:gomart/screens/Authentication/Login/bloc/login_cubit.dart';
import 'package:gomart/screens/Authentication/Register/bloc/registration_cubit.dart';
import 'package:gomart/screens/Authentication/authentication_screen.dart';
import 'package:gomart/screens/Home/Screens/Account/BusinessProfile/bloc/business_profile_cubit.dart';
import 'package:gomart/screens/Home/Screens/Account/EditBusiness/bloc/business_cubit.dart';
import 'package:gomart/screens/Home/Screens/Home/bloc/home_cubit.dart';
import 'package:gomart/screens/Search/bloc/search_cubit.dart';
import 'package:gomart/screens/debug/bloc/debug_cubit.dart';
import 'package:gomart/styles/color_schemes.dart';
import 'package:gomart/styles/styles.dart';
import 'package:gomart/service/bloc_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'injection.dart';

Future<void> main() async {
 /* WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
*/
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  Bloc.observer = BlocDelegateObserver();
  await configureDependencies();
  final client = StreamChatClient(
    'mkx4q8pu4yd4',
   // logLevel: Level.INFO,
  );

  await client.connectUser(
    User(id: 'msjahun', extraData: const {
      "name": "John Doe",
      "image": "https://i.imgur.com/fR9Jz14.png",
    }),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibXNqYWh1biJ9.0-lWg_JCl-hiJCs2OG8kR8nqgVtxAVjTbVr4Wz8Xsh8',
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
            create: (context) =>
                locator<LoginCubit>()..checkForPreviousPhoneNumber(),
          ),
          BlocProvider<DebugCubit>(
            create: (context) => locator<DebugCubit>(),
          ),
          BlocProvider<HomeCubit>(
            create: (context) => locator<HomeCubit>()..loadHomeProducts(),
          ),
          BlocProvider<SearchCubit>(
            create: (context) => locator<SearchCubit>(),
          ),
          BlocProvider<BusinessCubit>(
            create: (context) => locator<BusinessCubit>(),
          ),
          BlocProvider<BusinessProfileCubit>(
            create: (context) => locator<BusinessProfileCubit>(),
          )
        ],
        child: MyApp(
          client: client,
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
  }) : super(key: key);
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
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
/*      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),*/
      home: const Authentication(),
    );
  }
}
