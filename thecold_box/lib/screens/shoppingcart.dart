import 'package:flutter/material.dart';
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
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                  height: 100,
                  child: Image.asset(
                    "assets/shopping-bag.png",
                    fit: BoxFit.contain,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 50),
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
        onPressed: insertItem,
      ),
    );
  }

  void insertItem() {
    final newIndex = 1;
    final newItem = (List.of(listItems)..shuffle()).first;

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
}
