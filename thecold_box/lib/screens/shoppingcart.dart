import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:thecold_box/model/shopping_cart_model.dart';
import 'package:thecold_box/screens/list_item.dart';
import 'package:thecold_box/screens/list_item_widget.dart';
import 'package:thecold_box/screens/menu.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final List<ListItem> items = List.from(listItems);
  final ListKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Lottie.asset('assets/cart.json', height: 180),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Shopping Cart',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Expanded(
              child: AnimatedList(
                key: ListKey,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) => ListItemWidget(
                  item: items[index],
                  animation: animation,
                  onClicked: () => removeItem(index),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          createAlertDialog(context).then((onValue) {
            final newIndex = 1;
            final newItem = ListItem(title: onValue);

            items.add(newItem);

            items.insert(newIndex, newItem);
            ListKey.currentState!.insertItem(
              newIndex,
              duration: Duration(milliseconds: 400),
            );
          });
        },
      ),
    );
  }

  void insertItem() {
    final newIndex = 1;
    final newItem = (List.of(listItems)..shuffle()).last;

    items.insert(newIndex, newItem);
    ListKey.currentState!.insertItem(
      newIndex,
      duration: Duration(milliseconds: 400),
    );
  }

  void removeItem(int index) {
    final removedItem = items[index];

    items.removeAt(index);
    ListKey.currentState!.removeItem(
      index,
      (context, animation) => ListItemWidget(
          item: removedItem, animation: animation, onClicked: () {}),
      duration: Duration(milliseconds: 400),
    );
  }

  Future createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('What do you want to add?'),
            content: TextField(
              controller: customController,
            ),
            actions: [
              ElevatedButton(
                child: Text('Proceed'),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
              ),
            ],
          );
        });
  }
}
