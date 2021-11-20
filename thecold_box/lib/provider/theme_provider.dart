import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    //=> themeMode == ThemeMode.dark;
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(), //surface: Colors.purple.shade200),
    primaryColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
    backgroundColor: Colors.grey.shade900,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(primary: Colors.purple.shade800),
    primaryColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
    backgroundColor: Colors.white,
  );
}


//.styleFrom(primary: Theme.of(context).primaryColor),