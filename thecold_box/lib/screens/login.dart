import 'package:flutter/material.dart';

class LoginScreenNew extends StatefulWidget {
  const LoginScreenNew({Key? key}) : super(key: key);

  @override
  _LoginScreenNewState createState() => _LoginScreenNewState();
}

class _LoginScreenNewState extends State<LoginScreenNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
        ],
      ),
    );
  }
}
