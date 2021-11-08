import 'package:firebase_database/firebase_database.dart';
import 'package:thecold_box/model/item_model.dart';

final databseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveItem(Item Name) {
  var id = databseReference.child('item/').push();
  id.set(Name.toJson());
  return id;
}
