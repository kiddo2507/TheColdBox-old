import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thecold_box/screens/home_screen.dart';
import 'package:thecold_box/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var _email = prefs.getString('email');
  await Firebase.initializeApp();
  runApp(MaterialApp(home: _email == null ? LoginScreenNew() : HomePage()));
}


// Navigator.push(
//   context, MaterialPageRoute(builder: (context) => MenuPage()));