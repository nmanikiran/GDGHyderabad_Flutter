import 'package:flutter/material.dart';
import 'package:todo/todo_create.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
    );
  }

  static routes(BuildContext context) {
    return {
      '/create': (context) => TodoCreateEdit(),
      '/edit': (context) => TodoCreateEdit(),
    };
  }
}
