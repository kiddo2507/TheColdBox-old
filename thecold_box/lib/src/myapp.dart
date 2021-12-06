import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thecold_box/provider/theme_provider.dart';
import 'package:thecold_box/screens/home_screen.dart';
import 'package:thecold_box/screens/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

String finalEmail = '';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  // void initState() {
  //   getValidationData().whenComplete(() async {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) =>
  //                 finalEmail == null ? LoginScreenNew() : HomePage()));
  //   });
  //   super.initState();
  // }

  // Future getValidationData() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   var obtainedEmail = sharedPreferences.getString('email');
  //   setState(() {
  //     final finalEmail = obtainedEmail;
  //   });
  //   print(finalEmail);
  // }

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
