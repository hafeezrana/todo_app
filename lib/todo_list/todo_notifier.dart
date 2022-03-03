import 'package:flutter/foundation.dart';
import 'package:todo_app/models/todo.dart';

class TodoNotifier with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void createTodo(Todo todo) {
    _todos.insert(0, todo);
    notifyListeners();
  }

  void updateTodo(int index, Todo todo) {
    _todos[index] = todo;
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void removeAllTodo() {
    _todos.clear();
    notifyListeners();
  }
}
