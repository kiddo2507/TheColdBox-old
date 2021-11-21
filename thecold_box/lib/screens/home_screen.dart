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
  final items = ['1-3 days', 'Today', 'Tomorrow'];
  var idk = Useby();
  final Map data = {'apple': 3, 'banana': 2, 'onion': 8, 'eggplant': 4};
  var currentItemSelected = 'Today';
  bool value = false;
  final list = [
    HomeModel(id: 'Vegetable', name: 'Eggplant', useby: '21/11/2021'),
    HomeModel(id: 'Fruit', name: 'Apple', useby: '25/11/2021'),
    HomeModel(id: 'Fruit', name: 'Banana', useby: '28/11/2021'),
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
            Icons.person,
            size: 40,
          ),
        ),
        title: Text('Welcome, User'),
        centerTitle: true,
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
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                child:
                    Lottie.asset('assets/bg.json', alignment: Alignment.center),
              ),
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 250,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/og_bg.png'),
                        radius: 110,
                      ),
                      decoration: BoxDecoration(shape: BoxShape.circle),
                    ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView(
                          shrinkWrap: true,
                          children: [...list.map(buildSingleCheckbox).toList()],
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(175, 50),
                          elevation: 2,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CameraPage()));
                        },
                        icon: Icon(Icons.camera),
                        label: Text(
                          'Got More',
                          style: TextStyle(fontSize: 17),
                        )),
                  ],
                ),
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
      Card(
        elevation: 8,
        shadowColor: Colors.black,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          onTap: onClicked,
          leading: Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            value: list.isUsed,
            onChanged: (value) => onClicked(),
            checkColor: Colors.purple.shade800,
            activeColor: Colors.transparent,
          ),
          title: Text(
            list.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            list.id.toString(),
          ),
          trailing: Text(list.useby.toString()),
        ),
      );
}

// Padding(
                            //   padding:
                            //       const EdgeInsets.only(left: 170, top: 200),
                            //   child: Container(
                            //     decoration:
                            //         BoxDecoration(shape: BoxShape.circle),
                            //     child: Positioned(
                            //         child: Lottie.asset(
                            //       'assets/mushroom-bros.json',
                            //     )),
                            //   ),
                            // ),