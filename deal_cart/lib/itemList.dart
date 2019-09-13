import 'package:deal_cart/db/item_model.dart';
import 'package:deal_cart/itemCard.dart';
import 'package:deal_cart/itemDetails.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;

  const ItemList({Key key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return GridView.count(
      primary: true,
      crossAxisCount: isLandscape ? 3 : 2,
      childAspectRatio: 0.95,
      children: List.generate(items.length, (index) {
        return GestureDetector(
          child: ItemCard(items[index]),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ItemDetails(item: items[index])));
          },
        );
      }),
    );
  }
}