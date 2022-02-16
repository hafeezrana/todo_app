import 'package:flutter/material.dart';
import 'package:todo_app/todo_list/todo_controller.dart';
import 'package:todo_app/todo_list/todo_list_view.dart';
import 'package:todo_app/todo_list/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodoProvider(
      todoController: TodoController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoListView(),
      ),
    );
  }
}
