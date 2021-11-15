import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lottie/lottie.dart';
import 'package:thecold_box/model/home_model.dart';
import 'package:thecold_box/screens/camerapage.dart';
import 'package:thecold_box/screens/menu.dart';
import 'package:thecold_box/screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //adding some variable
  final Color? mainColor = Colors.blueGrey[50];
  final items = ['Today', 'Tomorrow', '1-3 days'];
  var currentItemSelected = 'Today';
  bool value = false;
  final list = [
    HomeModel(id: 'Vegetable', name: 'Potato'),
    HomeModel(id: 'Fruit', name: 'Strawberry'),
    HomeModel(id: 'Vegetable', name: 'Brinjal'),
    HomeModel(id: 'Vegetable', name: 'Cucumber'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          icon: Icon(
            Icons.person_outlined,
            size: 40,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuPage()));
            },
            icon: Icon(
              Icons.menu,
              size: 35,
            ),
          ),
        ],
      ),

      //Body
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20, bottom: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "The Cold Box",
                    style: TextStyle(fontSize: 45.0),
                  )),
              DropdownButton<String>(
                items: items.map((String dropdownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropdownStringItem,
                    child: Text(
                      dropdownStringItem,
                    ),
                  );
                }).toList(),
                onChanged: (String? newValueSelected) {
                  //your code to execute, when a menu item is selected from drop down
                  setState(() {
                    currentItemSelected = newValueSelected!;
                  });
                },
                value: currentItemSelected,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      backgroundBlendMode: BlendMode.softLight),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 170, top: 260),
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Positioned(
                              child: Lottie.asset(
                            'assets/mushroom-bros.json',
                          )),
                        ),
                      ),
                      Positioned(
                        child: ListView(
                          shrinkWrap: true,
                          children: [...list.map(buildSingleCheckbox).toList()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(175, 50),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CameraPage()));
                  },
                  child: Text(
                    'Got More',
                    style: TextStyle(fontSize: 17),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String items) => DropdownMenuItem(
        value: items,
        child: Text(
          items,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

  final gotMore = Material(
    elevation: 5,
    child: MaterialButton(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      onPressed: () {
        CameraPage;
      },
      child: const Text(
        "Got More?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  Widget buildSingleCheckbox(HomeModel list) => buildCheckBox(
      list: list,
      onClicked: () {
        setState(() {
          final newValue = !list.isUsed;
          list.isUsed = newValue;
        });
      });

  Widget buildCheckBox(
          {required HomeModel list, required VoidCallback onClicked}) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: list.isUsed,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          list.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        // subtitle: Text(
        //   list.useby,
        // ),
      );
}
