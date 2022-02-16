// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/todo_list/todo_controller.dart';

void main() {
  final todoListController = TodoController();
  test('initially todo list should be empty', () {
    todoListController.todos;
    expect(todoListController.todos, []);
  });
}
