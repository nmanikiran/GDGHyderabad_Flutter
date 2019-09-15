import 'package:feedback/AddFeedback.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FeedbackList(title: 'Flutter Demo Home Page'),
    );
  }
}

class FeedbackList extends StatefulWidget {
  final String title;

  const FeedbackList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FeedbackListState();
  }
}

class FeedbackListState extends State<FeedbackList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedbacks'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('feedback').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');
              default:
                return new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return new ListTile(
                      title: new Text(document['name']),
                      subtitle: new Text(document['email']),
                    );
                  }).toList(),
                );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddFeedback()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
