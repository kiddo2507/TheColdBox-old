import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:thecold_box/provider/theme_provider.dart';
import 'package:thecold_box/screens/home_screen.dart';
import 'package:thecold_box/screens/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:thecold_box/wontuse/login_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
      //ThemeMode themeMode = ThemeMode.system;
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'The Cold Box',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            //home: LoginScreenNew()
            home: AnimatedSplashScreen(
              splash: Lottie.asset('assets/splash-screen.json'),
              splashIconSize: 1000,
              centered: true,
              nextScreen: LoginScreenNew(),
              splashTransition: SplashTransition.slideTransition,
              duration: 2500,
              //backgroundColor: Color(0xff00000000),
            ),
          ); //email == null ? LoginScreenNew() : HomePage(),
        },
      );
}
