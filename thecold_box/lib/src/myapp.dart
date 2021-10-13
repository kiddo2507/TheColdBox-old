import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecold_box/provider/theme_provider.dart';
import 'package:thecold_box/screens/login.dart';

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
            home: LoginScreenNew(),
          );
        },
      );
}
