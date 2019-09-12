import 'package:deal_cart/noDataMessage.dart';
import 'package:flutter/material.dart';
import 'package:deal_cart/db/item_model.dart';
import 'package:deal_cart/itemDetails.dart';
import 'package:deal_cart/itemCard.dart';
import 'package:deal_cart/fetchData.dart';

class ShoesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShoesPageState();
  }
}

class ShoesPageState extends State<ShoesPage> {
  var fetchData = FetchData();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FutureBuilder(
          future: fetchData.getShoesData(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Item> shoes = snapshot.data;
              return shoes.isNotEmpty
                  ? new GridView.count(
                      primary: true,
                      crossAxisCount: 2,
                      childAspectRatio: 0.95,
                      children: List.generate(shoes.length, (index) {
                        return GestureDetector(
                          child: ItemCard(shoes[index]),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ItemDetails(item: shoes[index])));
                          },
                        );
                      }),
                    )
                  : NoDataMessage(message: 'No shoes yet!');
            }
            return Center(child: new CircularProgressIndicator());
          }),
    );
  }
}
