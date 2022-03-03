import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo_list/todo_notifier.dart';

import 'add_todo_view.dart';
import 'edit_todo_view.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your todos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'All delete',
            onPressed: () {
              context.read<TodoNotifier>().removeAllTodo();
            },
          ),
        ],
      ),
      body: Consumer<TodoNotifier>(
        builder: (context, todoNotifier, child) {
          if (todoNotifier.todos.isEmpty) {
            return const Center(
              child: Text('Add a new todo'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: todoNotifier.todos.length,
            itemBuilder: (context, index) {
              final todo = todoNotifier.todos[index];
              return Card(
                elevation: 4,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditTodoView(
                          todo: todo,
                          currentIndex: index,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(todo.task),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_forever),
                    tooltip: 'Delete',
                    onPressed: () {
                      context.read<TodoNotifier>().removeTodo(index);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTodoView(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
