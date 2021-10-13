import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thecold_box/provider/theme_provider.dart';
import 'package:thecold_box/src/myapp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var _email = prefs.getString('email');
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) => MyApp(),
    ),
  );
  //MaterialApp(home: _email == null ? LoginScreenNew() : HomePage()));
}


// Navigator.push(
//   context, MaterialPageRoute(builder: (context) => MenuPage()));