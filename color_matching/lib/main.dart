import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Color Matching",
        home: HomePageUI());
  }
}

class HomePageUI extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageUI> {
  bool isGameStarted = false;
  bool win = false;

  List<MaterialColor> containersColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  String msg = "";
  static var colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.yellow,
    Colors.red,
    Colors.yellow
  ];
  Color selectedColor = Colors.green;
  final _random = new Random();
  int noOfColors = colorList.length;
  int gameTime = 30;

  Color getRandomColor() {
    return colorList[_random.nextInt(noOfColors)];
  }

  void onTapClick(int index) {
    if (!isGameStarted) {
      alertBox("Start Game!",
          "Click on the play button on the top to start the game.");
    } else if (isGameStarted && containersColors[index] != selectedColor) {
      setState(() {
        containersColors[index] = getRandomColor();
      });
    }
  }

  startCountdown() {
    isGameStarted = true;
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        gameTime = gameTime - 1;

        if (containersColors.every((c) => c == selectedColor)) {
          timer.cancel();
          win = true;
          resetGame();
          alertBox("Congrats !", "You Won !!");
        }
        if (gameTime < 0) {
          timer.cancel();
          win = false;
          resetGame();
          alertBox("Time Up !", "Better luck next time");
        }
      });
    });
  }

  resetGame() {
    isGameStarted = false;
    containersColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];
    gameTime = 30;
    selectedColor = getRandomColor();
  }

  void alertBox(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$title"),
          content: Text("$content"),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Matching"),
      ),
      body: Container(
          child: Column(
        children: [
          gameHeaderWidget(),
          firstRowWidget(),
          secondRowWidget(),
          thirdRowWidget(),
        ],
      )),
    );
  }

  Padding gameHeaderWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text(
              "Time Left: $gameTime",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (!isGameStarted) {
                startCountdown();
              }
            },
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
              child: Icon(
                Icons.play_circle_filled,
                color: Colors.blueAccent,
              ),
              height: 40.0,
              width: 40.0,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: selectedColor,
                shape: BoxShape.rectangle),
            height: 40,
            width: 40,
          ),
        ],
      ),
    );
  }

  Row firstRowWidget() {
    return Row(children: [
      Expanded(
          child: GestureDetector(
              onTap: () {
                onTapClick(0);
              },
              child: Container(
                  margin: new EdgeInsets.all(4.0),
                  color: containersColors[0],
                  height: 150))),
      Expanded(
          child: GestureDetector(
              onTap: () {
                onTapClick(1);
              },
              child: Container(
                  margin: new EdgeInsets.all(4.0),
                  color: containersColors[1],
                  height: 150))),
      Expanded(
          child: GestureDetector(
              onTap: () {
                onTapClick(2);
              },
              child: Container(
                  margin: new EdgeInsets.all(4.0),
                  color: containersColors[2],
                  height: 150))),
    ]);
  }

  Expanded secondRowWidget() {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              onTapClick(3);
            },
            child: Container(
              margin: new EdgeInsets.all(4.0),
              color: containersColors[3],
            )));
  }

  Row thirdRowWidget() {
    return Row(children: [
      Expanded(
          child: GestureDetector(
              onTap: () {
                onTapClick(4);
              },
              child: Container(
                  margin: new EdgeInsets.all(4.0),
                  color: containersColors[4],
                  height: 150))),
      Expanded(
          child: GestureDetector(
              onTap: () {
                onTapClick(5);
              },
              child: Container(
                  margin: new EdgeInsets.all(4.0),
                  color: containersColors[5],
                  height: 150))),
      Expanded(
          child: GestureDetector(
              onTap: () {
                onTapClick(6);
              },
              child: Container(
                  margin: new EdgeInsets.all(4.0),
                  color: containersColors[6],
                  height: 150))),
    ]);
  }
}
