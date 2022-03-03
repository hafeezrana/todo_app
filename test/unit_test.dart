import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/todo_list/todo_notifier.dart';

void main() {
  final controller = TodoNotifier();

  test('todo list should be initially empty', () {
    expect(controller.todos.length, 0);
  });

  test('new todo should be created', () {
    controller.createTodo(Todo(task: 'Have to do unit test'));
    expect(controller.todos, [Todo(task: 'Have to do unit test')]);
    expect(controller.todos.length, 1);
  });

  test('existing todo should be updated', () {
    final existingTodo = controller.todos.indexWhere(
      (todo) => todo == Todo(task: 'Have to do unit test'),
    );
    controller.updateTodo(existingTodo, Todo(task: 'Have to do publish app'));
    expect(controller.todos, [Todo(task: 'Have to do publish app')]);
    expect(controller.todos.length, 1);
  });

  test('existing todo should be removed', () {
    final existingTodo = controller.todos.indexWhere(
      (todo) => todo == Todo(task: 'Have to do publish app'),
    );
    controller.removeTodo(existingTodo);
    expect(controller.todos.length, 0);
  });
}
