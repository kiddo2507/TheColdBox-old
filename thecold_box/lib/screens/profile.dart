import 'package:flutter/material.dart';
import 'package:thecold_box/screens/login_screen.dart';

import 'home_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              //icon
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                  height: 100,
                  child: Image.asset(
                    "assets/avatar.png",
                    fit: BoxFit.contain,
                  )),
            ),
            Padding(
              //name of the page
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'User profile',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(250, 60),
                        elevation: 2,
                      ),
                      onPressed: () {},
                      child: Text(
                        '<users name>',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(250, 60),
                        elevation: 2,
                      ),
                      onPressed: () {},
                      child: Text(
                        '<Email id>',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                  const SizedBox(
                    height: 200,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: Size(175, 50),
                        elevation: 2,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
