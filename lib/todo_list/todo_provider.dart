import 'package:flutter/material.dart';
import 'package:todo_app/todo_list/todo_controller.dart';

class TodoProvider extends InheritedWidget {
  const TodoProvider({
    required this.todoController,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final TodoController todoController;

  static TodoProvider of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<TodoProvider>();
    assert(provider != null, 'No Provider found in context');
    return provider!;
  }

  @override
  bool updateShouldNotify(covariant TodoProvider oldWidget) {
    return todoController != oldWidget.todoController;
  }
}
