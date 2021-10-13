import 'package:flutter/material.dart';
import 'package:thecold_box/model/category_model.dart';
import 'package:thecold_box/screens/thecold_box.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final list = [
    CategoryFilter(id: 'Fruit'),
    CategoryFilter(id: 'Vegetable'),
    CategoryFilter(id: 'Today'),
    CategoryFilter(id: 'Tomorrow'),
    CategoryFilter(id: '1 Week')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TheColdBox()));
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SizedBox(
        width: 400,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Filter",
                style: TextStyle(fontSize: 45.0),
              ),
              Text(
                'Categories',
                style: TextStyle(fontSize: 20),
              ),
              ListView(
                shrinkWrap: true,
                children: [...list.map(buildSingleCheckbox).toList()],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSingleCheckbox(CategoryFilter list) => buildCheckBox(
      list: list,
      onClicked: () {
        setState(() {
          final newValue = !list.isUsed;
          list.isUsed = newValue;
        });
      });

  Widget buildCheckBox(
          {required CategoryFilter list, required VoidCallback onClicked}) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: list.isUsed,
          onChanged: (value) => onClicked(),
        ),
        title: Text(
          list.id,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      );
}
