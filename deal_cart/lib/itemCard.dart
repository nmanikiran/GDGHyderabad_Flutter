import 'package:deal_cart/db/item_model.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Item product;
  ItemCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1.0,
        child: Container(
          padding: EdgeInsets.only(
            top: 18.0,
          ),
          child: Column(
            children: <Widget>[
              Image.network(
                product.image.replaceAll('https', 'http'),
                height: 130.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      product.title,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(product.price),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
