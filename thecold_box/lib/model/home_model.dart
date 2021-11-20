import 'package:thecold_box/screens/camerapage.dart';

final DateTime useby = DateTime.now();

class HomeModel {
  final String id;
  final String name;
  final String useby;
  bool isUsed;

  HomeModel(
      {required this.id,
      required this.name,
      this.isUsed = false,
      required this.useby});
}

//final Map data = {'apple': 3, 'banana': 2, 'onion': 8, 'eggplant': 4};

String Useby() {
  final Map data = {
    'Apple': '2/12/2021',
    'Banana': '2/12/2021',
    'Orange': '3/12/2021',
    'Mango': '3/12/2021',
    'Grapes': '4/12/2021',
    'Cauliflower': '4/12/2021',
    'Eggplant': '2/12/2021',
    'Potato': '5/12/2021',
    'Onion': '5/12/2021',
    'Cabbage': '3/12/2021'
  };
  int l = data.length;
  String value1 = '';

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
    'Orange': 'Fruit',
    'Mango': 'Fruit',
    'Grapes': 'Fruit',
    'Cauliflower': 'Vegetable',
    'Eggplant': 'Vegetable',
    'Potato': 'Vegetable',
    'Onion': 'Vegetable',
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
