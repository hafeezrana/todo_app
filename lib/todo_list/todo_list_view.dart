import 'package:flutter/material.dart';
import 'package:todo_app/todo_list/add_todo_view.dart';
import 'package:todo_app/todo_list/todo_list_controller.dart';
import 'package:todo_app/todo_list/update_todo_view.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({
    Key? key,
    required this.todoListController,
  }) : super(key: key);

  final TodoListController todoListController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: todoListController.todos.length,
        itemBuilder: (context, index) {
          final todo = todoListController.todos[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateTodoView(
                    todoListController: todoListController,
                  ),
                ),
              );
            },
            title: Text(todo.task),
            trailing: IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                todoListController.removeTodo(todo);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTodoView(
                todoListController: todoListController,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
