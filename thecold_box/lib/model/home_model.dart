import 'package:thecold_box/screens/camerapage.dart';

class HomeModel {
  final String id;
  final String name;
  final int useby;
  bool isUsed;

  HomeModel(
      {required this.id,
      required this.name,
      required this.useby,
      this.isUsed = false});
}

//final Map data = {'apple': 3, 'banana': 2, 'onion': 8, 'eggplant': 4};

int Useby() {
  final Map data = {
    'Apple': 3,
    'Banana': 2,
    'Onion': 8,
    'Eggplant': 4,
    'Mango': 5,
    'Cabbage': 6
  };
  int l = data.length;
  int value1 = 0;

  var output1 = '';
  data.forEach((key, value) {
    output1 = output;
    if (key == output1) {
      value1 = value;
    }
  });
  return value1;
}

String Filter() {
  final Map filter = {
    'Apple': 'Fruit',
    'Banana': 'Fruit',
    'Onion': 'Vegetable',
    'Eggplant': 'Vegetable',
    'Mango': 'Fruit',
    'Cabbage': 'Vegetable'
  };

  String output2 = '';
  String value2 = '';
  filter.forEach((key, value) {
    output2 = output;
    if (key == output2) {
      value2 = value;
    }
  });

  return value2;
}
