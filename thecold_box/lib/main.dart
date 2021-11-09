import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thecold_box/provider/theme_provider.dart';
import 'package:thecold_box/screens/home_screen.dart';
import 'package:thecold_box/screens/login.dart';
import 'package:thecold_box/src/myapp.dart';

List<CameraDescription>? camera;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  camera = await availableCameras();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) => MyApp(),
      //MaterialApp(home: email == null ? LoginScreenNew() : HomePage()),
    ),
  );
}


// Navigator.push(
//   context, MaterialPageRoute(builder: (context) => MenuPage()));