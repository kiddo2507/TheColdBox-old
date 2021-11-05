import 'package:flutter/material.dart';
import 'package:thecold_box/model/shopping_cart_model.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizeTransition(
        sizeFactor: animation,
        child: buildItem(),
      );

  Widget buildItem() => Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: Checkbox(
            value: true,
            onChanged: (bool) {},
          ),
          title: Text(
            item.title,
            style: TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: onClicked,
          ),
        ),
      );
}
