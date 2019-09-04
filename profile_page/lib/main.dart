import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Colors.white),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color textColor = Colors.black;
  Color bgColor = Colors.white;

  bool isDarkTheme = false;
  changeTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
      textColor = isDarkTheme ? Colors.white : Colors.black;
      bgColor = !isDarkTheme ? Colors.white : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0.0,
          leading: new Icon(Icons.arrow_back, color: textColor),
          actions: [
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: new Icon(
                    isDarkTheme ? Icons.favorite : Icons.favorite_border,
                    color: textColor),
              ),
              onTap: () => changeTheme(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: new Icon(Icons.more_vert, color: textColor),
            )
          ]),
      body: Container(
          color: bgColor,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                _profilePic(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                _profileDetails(textColor),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                _connectMe(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                _roundedButton('Hire Me'),
                Padding(
                  padding: EdgeInsets.all(16.0),
                ),
                Divider(
                  color: Colors.grey,
                  indent: 50.0,
                  endIndent: 50.0,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _socialPresence(
                        textColor, "assets/images/dribble.png", '1.3k'),
                    _socialPresence(
                        textColor, "assets/images/behance.png", '1.3k'),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

Row _connectMe() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
          width: 50.0,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: new Image.asset("assets/images/twitter.png"))),
      Container(
          width: 50.0,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: new Image.asset("assets/images/medium.png"))),
      Container(
          width: 50.0,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: new Image.asset("assets/images/linkedin.png"))),
    ],
  );
}

Container _socialPresence(textColor, image, String floowersCount) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(width: 60.0, child: new Image.asset(image)),
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Text(
          floowersCount,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        Opacity(
          opacity: 0.8,
          child: Text(
            'Followers',
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w600, fontSize: 20.0),
          ),
        )
      ],
    ),
  );
}

Column _profileDetails(textColor) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Taylor Watson',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor, fontSize: 24.0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.0),
        ),
        Opacity(
          opacity: 0.4,
          child: Text(
            'PRODUCT DESIGNER',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: textColor, fontSize: 16.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Text(
          'Create great interfaces',
          style: TextStyle(
              color: textColor, fontSize: 20.0, fontWeight: FontWeight.w400),
        ),
        Text(
          '@TwWorks',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: textColor,
              fontSize: 20.0,
              decoration: TextDecoration.underline),
        )
      ]);
}

Stack _profilePic() {
  return Stack(
    alignment: Alignment(0, 1),
    children: <Widget>[
      CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage("assets/images/profile_image.jpeg"),
      ),
      Container(
        child: Icon(
          Icons.check_circle,
          color: Colors.blue,
        ),
        alignment: Alignment(0.20, 0),
      )
    ],
  );
}

MaterialButton _roundedButton(String title) {
  return MaterialButton(
    shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0)),
    padding: EdgeInsets.all(8.0),
    textColor: Colors.white,
    color: Colors.blue,
    minWidth: 180.0,
    height: 50.0,
    onPressed: () => {},
    child: Text(
      title,
      style: TextStyle(fontSize: 20.0),
    ),
  );
}
