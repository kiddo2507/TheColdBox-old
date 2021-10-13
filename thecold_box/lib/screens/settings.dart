import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecold_box/provider/theme_provider.dart';
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
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                  height: 100,
                  child: Icon(
                    Icons.settings,
                    size: 100,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 50),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('User System preference'),
                    ),
                    ChangeThemeButtonWidget(),
                  ],
                ),
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
                  '<Option 1>',
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
                  '<Option 2>',
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
                  '<Option 3>',
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
