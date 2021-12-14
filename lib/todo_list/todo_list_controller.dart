import 'package:flutter/foundation.dart';
import 'package:todo_app/models/todo.dart';

class TodoListController with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void createTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
