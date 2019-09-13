import 'package:deal_cart/BottomNavBar.dart';
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
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedTabIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Container(
            color: Colors.white,
            child: DropdownButton(
              onChanged: (value) {},
              elevation: 0,
              underline: Container(),
              items: <DropdownMenuItem>[
                DropdownMenuItem(
                  value: 0,
                  child: Text(
                    "Popular",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text(
                    "Trend",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
              ],
              value: 0,
            ),
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
        body: PageView.builder(
          itemCount: _pageList.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return _pageList[index];
          },
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _selectedTabIndex,
          items: [
            NavItem(
              text: "Home",
              iconData: Icons.home,
              color: Colors.indigo,
            ),
            NavItem(
              text: "Messages",
              iconData: Icons.message,
              color: Colors.pinkAccent,
            ),
            NavItem(
              text: "Wishlist",
              iconData: Icons.favorite_border,
              color: Colors.yellow.shade900,
            ),
            NavItem(
              text: "Account",
              iconData: Icons.person_outline,
              color: Colors.teal,
            ),
          ],
          onBarTap: (int index) {
            setState(() {
              _selectedTabIndex = index;
              if (_pageController.hasClients) {
                _pageController.animateToPage(
                  _selectedTabIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            });
          },
        ));
  }
}
