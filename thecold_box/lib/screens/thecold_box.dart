import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:thecold_box/model/home_model.dart';
import 'package:thecold_box/screens/camerapage.dart';
import 'package:thecold_box/screens/date_view.dart';
import 'package:thecold_box/screens/filter_page.dart';
import 'package:thecold_box/screens/menu.dart';

class TheColdBox extends StatefulWidget {
  @override
  _TheColdBoxState createState() => _TheColdBoxState();
}

class _TheColdBoxState extends State<TheColdBox> {
  final Color? mainColor = Colors.blueGrey[50];
  bool value = false;
  final list = [
    HomeModel(id: 'Vegetable', name: 'Pumpkin'),
    HomeModel(id: 'Fruit', name: 'Banana'),
    HomeModel(id: 'Fruit', name: output),
    //HomeModel(id: 'Fruit', name: 'Tomatoes', useby: '06/08'),
    //HomeModel(id: 'Vegetable', name: 'Carrot', useby: '06/08'),
    //HomeModel(id: 'Vegetable', name: 'Ladyfinger', useby: '10/08'),
    //HomeModel(id: 'Fruit', name: 'Strawberry', useby: '10/08'),
    //HomeModel(id: 'Vegetable', name: 'Brinjal', useby: '10/08'),
    //HomeModel(id: 'Vegetable', name: 'Cucumber', useby: '10/08'),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FilterPage()));
            },
            icon: Icon(
              Icons.filter_list_outlined,
              size: 35,
            ),
          ),
        ],
      ),
      body: Container(
        width: width * 0.99,
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "The Cold Box List",
                style: TextStyle(fontSize: 40.0),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [...list.map(buildSingleCheckbox).toList()],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 50),
                      elevation: 2,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CameraPage()));
                      print(width);
                    },
                    child: Text(
                      'Got More',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 50),
                      elevation: 2,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DateView()));
                      //openDialogueBox(context);
                    },
                    child: Text(
                      'Calendar view',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
  // openDialogueBox(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Calendar'),
  //           content: Container(
  //             height: 200,
  //             child: CalendarView(),
  //           ),
  //         );
  //       });
  // }
}
