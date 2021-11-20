import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:thecold_box/provider/theme_provider.dart';
import 'package:thecold_box/screens/changenotif.dart';
import 'package:thecold_box/screens/changetheme.dart';
import 'package:thecold_box/screens/menu.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
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
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                //decoration: BoxDecoration(color: Colors.red),
                child: Lottie.asset(
                  'assets/settings.json',
                  height: 190,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 50),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Dark Theme',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    ChangeThemeButtonWidget(),
                  ],
                ),
              ],
            ),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       minimumSize: Size(250, 60),
            //       elevation: 2,
            //     ),
            //     onPressed: () {
            //       changeNotif();
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Text(
            //           'Dark theme',
            //           style: TextStyle(fontSize: 17),
            //         ),
            //         ChangeThemeButtonWidget(),
            //       ],
            //     )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Notifications',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                changeNotif(),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 60),
                  elevation: 2,
                ),
                onPressed: () {},
                child: Text(
                  'Recent Scans',
                  style: TextStyle(fontSize: 17),
                )),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 60),
                  elevation: 2,
                ),
                onPressed: () {},
                child: Text(
                  'Help',
                  style: TextStyle(fontSize: 17),
                )),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 60),
                  elevation: 2,
                ),
                onPressed: () {},
                child: Text(
                  'Spread a word',
                  style: TextStyle(fontSize: 17),
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
