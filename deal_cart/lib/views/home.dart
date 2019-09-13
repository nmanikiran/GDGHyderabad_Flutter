import 'package:flutter/material.dart';
import 'package:deal_cart/views/jacketsPage.dart';
import 'package:deal_cart/views/shoesPage.dart';
import 'package:deal_cart/views/bagsPage.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<Home> with TickerProviderStateMixin {
  List<Tab> tabList = List();
  TabController _tabController;

  @override
  void initState() {
    tabList.add(new Tab(
      text: 'Bags',
    ));
    tabList.add(new Tab(
      text: 'Shoes',
    ));
    tabList.add(new Tab(
      text: 'Jackets',
    ));
    _tabController = new TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: new TabBar(
                  isScrollable: true,
                  labelStyle: TextStyle(fontSize: 21.0),
                  controller: _tabController,
                  labelColor: Colors.indigo,
                  indicatorWeight: 2,
                  unselectedLabelColor: Colors.grey,
                  indicator: UnderlineTabIndicator(),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: tabList),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 250,
              child: new TabBarView(
                controller: _tabController,
                children: [
                  BagsPage(),
                  ShoesPage(),
                  JacketsPage(),
                ],
              ),
            )
          ],
        ));
  }
}
