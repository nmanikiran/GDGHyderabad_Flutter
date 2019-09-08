import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/db/todo_modal.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function onTapItem;
  final Function onDelete;

  const TodoList({Key key, this.todos, this.onTapItem, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: todos == null ? 0 : todos.length,
          itemBuilder: (context, position) {
            return Card(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: Text('${todos[position].title}'),
                      key: key,
                      onTap: () => onTapItem(position),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: () => onDelete(position),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
