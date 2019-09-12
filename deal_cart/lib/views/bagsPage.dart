import 'package:deal_cart/noDataMessage.dart';
import 'package:flutter/material.dart';
import 'package:deal_cart/db/item_model.dart';
import 'package:deal_cart/itemDetails.dart';
import 'package:deal_cart/itemCard.dart';
import 'package:deal_cart/fetchData.dart';

class BagsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BagsPageState();
  }
}

class BagsPageState extends State<BagsPage> {
  var fetchData = FetchData();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FutureBuilder(
          future: fetchData.getBagsData(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Item> bags = snapshot.data;
              return bags.isNotEmpty
                  ? new GridView.count(
                      primary: true,
                      crossAxisCount: 2,
                      childAspectRatio: 0.95,
                      children: List.generate(bags.length, (index) {
                        return GestureDetector(
                          child: ItemCard(bags[index]),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ItemDetails(item: bags[index])));
                          },
                        );
                      }),
                    )
                  : NoDataMessage(message: 'No Bags yet!');
            }
            return Center(child: new CircularProgressIndicator());
          }),
    );
  }
}
