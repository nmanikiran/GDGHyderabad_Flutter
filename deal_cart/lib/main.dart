import 'package:flutter/material.dart';

import './views/account.dart';
import './views/home.dart';
import './views/notifications.dart';
import './views/wishlist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTabIndex = 0;
  List _pageList = [
    Home(),
    Notifications(),
    Wishlist(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Popular',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold)),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.black,
            ),
            onPressed: () => null,
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () => null,
          ),
        ],
      ),
      body: _pageList[_selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1.0,
        backgroundColor: Colors.amberAccent,
        showSelectedLabels: true,
        currentIndex: _selectedTabIndex,
        onTap: (int index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        items: [
          _bottomNavItem(Icons.home, 'Home'),
          _bottomNavItem(Icons.notifications, 'Messages'),
          _bottomNavItem(Icons.favorite, 'Wishlist'),
          _bottomNavItem(Icons.account_circle, 'Account'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomNavItem(icon, label) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: Colors.black),
        title: Text(
          label,
          style: TextStyle(color: Colors.black),
        ));
  }
}
