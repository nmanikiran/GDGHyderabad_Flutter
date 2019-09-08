import 'package:flutter/material.dart';
import 'package:todo/db/todo_db.dart';
import 'package:todo/db/todo_modal.dart';

class TodoCreateEdit extends StatefulWidget {
  final Todo todo;
  TodoCreateEdit({this.todo});
  @override
  State<StatefulWidget> createState() {
    return TodoCreateEditState(todo: todo);
  }
}

class TodoCreateEditState extends State<TodoCreateEdit> {
  final Todo todo;
  TodoCreateEditState({this.todo});

  final _formKey = GlobalKey<FormState>();
  var db = new TodoDBHelper();
  String todoText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(todo != null ? 'Update Todo' : 'Add Todo'),
        ),
        body: Container(
            color: Colors.white,
            margin: EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: todo != null ? todo.title : '',
                    decoration: InputDecoration(hintText: 'Enter your todo'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      } else {
                        setState(() {
                          todoText = value;
                        });
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    color: Colors.green,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        if (this.todo != null) {
                          await db.updateTodo(
                              Todo(title: todoText, id: this.todo.id));
                        } else {
                          await db.addTodo(Todo(title: todoText));
                        }
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      this.todo != null ? 'Update Todo' : 'Add Todo',
                      style: TextStyle(color: Colors.white),
                      textScaleFactor: 1.25,
                    ),
                  ),
                ],
              ), // Build this out in the next steps.
            )));
  }
}
