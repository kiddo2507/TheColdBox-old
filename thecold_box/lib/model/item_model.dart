import 'package:firebase_database/firebase_database.dart';

class Item {
  String? name;
  DatabaseReference? _id;

  Item({this.name});

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {'name': this.name};
  }
}
