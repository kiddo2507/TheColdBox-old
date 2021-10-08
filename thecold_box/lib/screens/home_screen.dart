import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:thecold_box/model/home_model.dart';
import 'package:thecold_box/screens/camerapage.dart';

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
    HomeModel(name: 'Apple', useby: '03/08'),
    HomeModel(name: 'Potato', useby: '03/08'),
    HomeModel(name: 'Drumsticks', useby: '04/08'),
    HomeModel(name: 'Apple', useby: '06/08'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      //App Bar
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          color: Colors.black,
          icon: Icon(
            Icons.person,
            size: 40,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: Icon(
              Icons.menu,
              size: 40,
            ),
          ),
        ],
      ),

      //Body
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(
                height: 400,
                child: ListView(
                  children: [...list.map(buildSingleCheckbox).toList()],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: gotMore,
              ),
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
    color: Colors.black,
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
          color: Colors.white,
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
        subtitle: Text(
          list.useby,
        ),
      );
}
