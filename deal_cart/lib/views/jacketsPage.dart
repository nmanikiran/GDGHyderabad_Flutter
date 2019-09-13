import 'package:deal_cart/itemList.dart';
import 'package:deal_cart/noDataMessage.dart';
import 'package:flutter/material.dart';
import 'package:deal_cart/db/item_model.dart';
import 'package:deal_cart/fetchData.dart';

class JacketsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JacketsPageState();
  }
}

class JacketsPageState extends State<JacketsPage> {
  var fetchData = FetchData();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FutureBuilder(
          future: fetchData.getJacketsData(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Item> jackets = snapshot.data;
              return jackets.isNotEmpty
                  ? ItemList(items: jackets)
                  : NoDataMessage(message: 'No jackets yet!');
            }
            return Center(child: new CircularProgressIndicator());
          }),
    );
  }
}
