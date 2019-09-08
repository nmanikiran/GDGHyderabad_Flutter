import 'package:flutter/material.dart';
import 'package:todo/db/todo_modal.dart';
import 'package:todo/todo_create.dart';
import 'package:todo/todo_list.dart';
import 'package:todo/routes.dart';

import 'package:todo/db/todo_db.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Routes.routes(context),
      home: MyHomePage(title: 'Todos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var db;
  List<Todo> todoList = new List();

  @override
  void initState() {
    super.initState();
    db = new TodoDBHelper();
  }

  onTapItem(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TodoCreateEdit(todo: todoList[index])));
  }

  onDelete(int index) async {
    await db.deleteTodo(todoList[index].id);
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: FutureBuilder<List<Todo>>(
                  future: db.getTodos(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      todoList = snapshot.data;

                      return TodoList(
                          todos: todoList,
                          onTapItem: onTapItem,
                          onDelete: onDelete);
                    }
                    return todoList.length == 0
                        ? Text('No todos yet!')
                        : CircularProgressIndicator();
                  }),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => TodoCreateEdit())),
        child: Icon(Icons.add),
      ),
    );
  }
}
