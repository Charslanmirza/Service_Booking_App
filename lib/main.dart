import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_app_flutter/providers/bloc.dart';
import 'package:services_app_flutter/screens/general_services_screen_1.dart';
import 'package:services_app_flutter/screens/google_map_screen.dart';
import 'package:services_app_flutter/screens/sign_in_screen.dart';
import 'package:services_app_flutter/screens/menu_screen.dart';
import 'package:services_app_flutter/screens/welcome_screen.dart';
import 'screens/sign_up_screen.dart';
import 'providers/location_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ServicesApp());
}

class ServicesApp extends StatelessWidget {
  const ServicesApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderMaps()..getUserLocation())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.orange.shade400,
          scaffoldBackgroundColor: Colors.white,
          canvasColor: Colors.transparent,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Colors.orange.shade400),
        ),
        initialRoute: "/signup",
        routes: {
          "/signup": (context) => SignUpScreen(),
          "/login": (context) => SignInScreen(),
          "/menu": (context) => MenuScreen(),
          "/welcome": (context) => WelcomeScreen(),
          // "/general-1" : (context) => GeneralScreen(),
          "/map": (context) => GoogleMapScreen(),
        },
      ),
    );
  }
}
