import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/todo_list/todo_notifier.dart';

import 'add_todo_view.dart';
import 'edit_todo_view.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your todos'),
      ),
      body: todos.isEmpty
          ? const Center(child: Text('Add a new todo'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Card(
                  elevation: 4,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditTodoView(todo: todo),
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
                        ref
                            .read(todoNotifierProvider.notifier)
                            .removeTodo(todo.id!);
                      },
                    ),
                  ),
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
