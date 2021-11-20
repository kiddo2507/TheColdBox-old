import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
    HomeModel(id: 'Vegetable', name: 'Eggplant', useby: '21/12/2021'),
    HomeModel(id: 'Fruit', name: 'Apple', useby: '25/11/2021'),
    HomeModel(id: 'Vegetable', name: 'Pumpkin', useby: '23/12/2021'),
    HomeModel(id: 'Fruit', name: 'Tomatoes', useby: '25/11/2021'),
    HomeModel(id: 'Vegetable', name: 'Carrot', useby: '26/11/2021'),
    HomeModel(id: 'Fruit', name: 'Banana', useby: '28/11/2021'),
    HomeModel(id: 'Vegetable', name: 'Ladyfinger', useby: '29/11/2021'),
    HomeModel(id: 'Fruit', name: 'Strawberry', useby: '2/12/2021'),
    HomeModel(id: 'Vegetable', name: 'Cucumber', useby: '2/12/2021'),
    HomeModel(id: Filter(), name: output, useby: Useby()),
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
          child: Stack(
            children: [
              Positioned(
                child:
                    Lottie.asset('assets/bg.json', alignment: Alignment.center),
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Your List",
                    style: TextStyle(fontSize: 40.0),
                  ),
                  const SizedBox(height: 20),
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
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 50),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DateView()));
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
