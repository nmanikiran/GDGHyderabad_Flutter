import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final List<NavItem> items;
  final Function onBarTap;
  final int currentIndex;

  BottomNavBar({
    this.items,
    this.onBarTap,
    this.currentIndex,
  });

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  int selectedBarIndex;

  @override
  void initState() {
    super.initState();
    selectedBarIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 16.0,
          top: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    return List.generate(widget.items.length, (i) {
      NavItem item = widget.items[i];
      bool isSelected = selectedBarIndex == i;
      return InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
            widget.onBarTap(selectedBarIndex);
          });
        },
        child: navItemContainer(isSelected, item),
      );
    });
  }

  AnimatedContainer navItemContainer(bool isSelected, NavItem item) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
          color:
              isSelected ? Colors.white.withOpacity(0.35) : Colors.transparent,
          // color: isSelected ? item.color.withOpacity(0.35) : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        children: <Widget>[
          Icon(
            item.iconData,
            color: Colors.black54, // item.color,
            size: 28.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            vsync: this,
            child: Text(
              isSelected ? item.text : "",
              style: TextStyle(
                  color: Colors.black38, // item.color,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}

class NavItem {
  String text;
  IconData iconData;
  Color color;

  NavItem({this.text, this.iconData, this.color});
}
