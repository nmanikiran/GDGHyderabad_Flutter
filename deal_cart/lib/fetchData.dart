import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:deal_cart/db/dbHelper.dart';
import 'package:deal_cart/db/item_model.dart';

class FetchData {
  var dbHelper = new DealCartDBHelper();

  Future<List> getBagsData(BuildContext context) async {
    var bagData = await DefaultAssetBundle.of(context)
        .loadString("assets/data/bags.json");
    var bagsData = jsonDecode(bagData);
    dbHelper.getBags().then((data) {
      if (data.length == 0) {
        for (var bag in bagsData) {
          Item _eachBag = Item.fromJson(bag);
          dbHelper.addBag(_eachBag);
        }
      }
    });
    return dbHelper.getBags();
  }

  Future<List> getShoesData(BuildContext context) async {
    var shoeData = await DefaultAssetBundle.of(context)
        .loadString("assets/data/shoes.json");
    var shoesData = jsonDecode(shoeData);
    dbHelper.getShoes().then((data) {
      if (data.length == 0) {
        for (var shoe in shoesData) {
          Item _shoe = Item.fromJson(shoe);
          dbHelper.addShoe(_shoe);
        }
      }
    });
    return dbHelper.getShoes();
  }

  Future<List> getJacketsData(BuildContext context) async {
    var jacketData = await DefaultAssetBundle.of(context)
        .loadString("assets/data/jackets.json");
    var jacketsData = jsonDecode(jacketData);
    dbHelper.getJackets().then((data) {
      if (data.length == 0) {
        for (var jacket in jacketsData) {
          Item _jacket = Item.fromJson(jacket);
          dbHelper.addJacket(_jacket);
        }
      }
    });
    return dbHelper.getJackets();
  }

  Future<List> getFavoritesData(BuildContext context) async {
    return dbHelper.getFavorites();
  }
}
