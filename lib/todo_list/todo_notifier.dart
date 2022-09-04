import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:uuid/uuid.dart';

final todoNotifierProvider =
    StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier({List<Todo>? todos}) : super(todos ?? const <Todo>[]);

  static const _uuid = Uuid();

  void createTodo(String task) {
    state = [
      ...state,
      Todo(
        id: _uuid.v4(),
        task: task,
      )
    ];
  }

  void updateTodo({
    required String id,
    required String task,
  }) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            task: task,
          )
        else
          todo
    ];
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
