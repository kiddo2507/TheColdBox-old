import 'package:thecold_box/screens/camerapage.dart';

DateTime now = DateTime.now();
DateTime predict = now.add(Duration(days: useby()));

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

String Useby() {
  final Map data = {
    'Apple': '4/12/2021',
    'Banana': '27/11/2021',
    'Orange': '2/12/2021',
    'Mango': '29/11/2021',
    'Grapes': '6/12/2021',
    'Cauliflower': '4/12/2021',
    'Eggplant': '28/11/2021',
    'Potato': '14/12/2021',
    'Onion': '7/12/2021',
    'Cabbage': '2/12/2021'
  };
  final Map realdata = {
    'Apple': 10,
    'Banana': 3,
    'Orange': 8,
    'Mango': 5,
    'Grapes': 12,
    'Cauliflower': 10,
    'Eggplant': 4,
    'Potato': 20,
    'Onion': 15,
    'Cabbage': 8
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

int useby() {
  return 0;
}
