import 'package:flutter/material.dart';
import 'package:todo_app/todo_list/todo_list_controller.dart';
import 'package:todo_app/todo_list/todo_list_view.dart';

void main() {
  final todoListController = TodoListController();
  runApp(MyApp(todoListController: todoListController));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.todoListController,
  }) : super(key: key);

  final TodoListController todoListController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: todoListController,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: TodoListView(todoListController: todoListController),
        );
      },
    );
  }
}
