import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo_list/todo_list_view.dart';
import 'package:todo_app/todo_list/todo_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListView(),
    );
  }
}
