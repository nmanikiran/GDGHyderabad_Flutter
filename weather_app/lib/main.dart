import 'package:flutter/material.dart';

void main() => runApp(MyWeatherApp());

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu, color: Colors.black),
        centerTitle: true,
        title: Text(
          "India, Mumbai",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.search, color: Colors.black))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _chipButton("Today", true),
                  _chipButton("Tomorrow", false),
                  _chipButton("Next Week", false),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
                child: _weatherCard(25, "Colud & Sun", 35),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Next 15 Days",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                ),
              ),
              _dayWiseDetails(context),
            ],
          ),
        ),
      ),
    );
  }
}

Stack _weatherCard(temp, String weather, double humidity) {
  return Stack(
    alignment: Alignment(0, 0),
    children: <Widget>[
      Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset("assets/images/current_weather_background.png"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        margin: EdgeInsets.all(10),
      ),
      _weatherCardDetails(temp, weather, humidity),
    ],
  );
}

Container _weatherCardDetails(temp, weather, humidity) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("$temp\u1d52",
            style: TextStyle(fontSize: 90.0, color: Colors.white)),
        Text(
          weather,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
          child: Text("Humidity",
              style: TextStyle(fontSize: 16.0, color: Colors.white)),
        ),
        Text("$humidity\u1d52",
            style: TextStyle(fontSize: 12.0, color: Colors.white))
      ],
    ),
  );
}

Expanded _dayWiseDetails(BuildContext context) {
  double width = MediaQuery.of(context).size.width / 3;
  return Expanded(
      child: ListView(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    children: <Widget>[
      _weatherDayDetails(width, "Monday", "assets/images/sun.png", "40",
          "56\u1d52 69\u1d52", Colors.lightGreen),
      _weatherDayDetails(width, "Tuesday", "assets/images/light.png", "50",
          "62\u1d52 79\u1d52", Colors.pinkAccent),
      _weatherDayDetails(width, "Wednesday", "assets/images/rain.png", "60",
          "15\u1d52 25\u1d52", Colors.orangeAccent),
      _weatherDayDetails(width, "Thursday", "assets/images/light_cloud.png",
          "35", "30\u1d52 36\u1d52", Colors.greenAccent),
      _weatherDayDetails(width, "Friday", "assets/images/sun.png", "70",
          "46\u1d52 56\u1d52", Colors.redAccent),
    ],
  ));
}

Container _weatherDayDetails(
    width, dayName, image, weather, weatherRange, color) {
  return Container(
      width: width,
      child: Card(
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                dayName,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Column(
              children: <Widget>[
                Image.asset(image),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "$weather\u1d52",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                weatherRange,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2.0,
        margin: EdgeInsets.all(10),
      ));
}

Chip _chipButton(label, bool isActve) {
  return Chip(
      label: new Text(
        label,
        style: TextStyle(color: isActve ? Colors.blue : Colors.black),
      ),
      backgroundColor: isActve ? Colors.grey.shade200 : Colors.white,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)));
}
