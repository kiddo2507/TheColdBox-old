import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:thecold_box/screens/home_screen.dart';
import 'package:thecold_box/screens/settings.dart';
import 'package:thecold_box/screens/shoppingcart.dart';
import 'package:thecold_box/screens/thecold_box.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Lottie.asset('assets/menu.json', height: 150),
              // child: Image.asset(
              //   "assets/menu.png",
              //   fit: BoxFit.contain,
              // ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(250, 60),
                        elevation: 2,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TheColdBox()));
                      },
                      child: Text(
                        'The Cold Box',
                        style: TextStyle(fontSize: 17),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(250, 60),
                        elevation: 2,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoppingCart()));
                      },
                      child: Text(
                        'Shopping List',
                        style: TextStyle(fontSize: 17),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(250, 60),
                        elevation: 2,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()));
                      },
                      child: Text(
                        'Settings',
                        style: TextStyle(fontSize: 17),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(250, 60),
                          elevation: 2,
                        ),
                        onPressed: () {
                          launch(
                              'https://kiddo2507.github.io/TheColdBoxWebsite/');
                        },
                        child: Text(
                          'TBC Website',
                          style: TextStyle(fontSize: 17),
                        )),
                    onTap: () => launch(
                        'https://kiddo2507.github.io/TheColdBoxWebsite/'),
                  ),
                  // InkWell(
                  //     child: TextButton(
                  //       style: TextButton.styleFrom(
                  //         backgroundColor: Color(0xFF6300EC),
                  //         padding: const EdgeInsets.fromLTRB(74, 20, 74, 20),
                  //         textStyle: const TextStyle(fontSize: 17),
                  //       ),
                  //       onPressed: () => launch(
                  //           'https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
                  //       child: const Text(
                  //         'TBC Website',
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //     ),
                  //     onTap: () => launch(
                  //         'https://docs.flutter.io/flutter/services/UrlLauncher-class.html')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
