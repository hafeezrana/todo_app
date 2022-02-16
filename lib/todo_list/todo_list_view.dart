import 'package:flutter/material.dart';
import 'package:todo_app/todo_list/add_todo_view.dart';
import 'package:todo_app/todo_list/edit_todo_view.dart';
import 'package:todo_app/todo_list/todo_provider.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoController = TodoProvider.of(context).todoController;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your todos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'All delete',
            onPressed: () {
              todoController.removeAllTodo();
            },
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: todoController,
        builder: (context, child) {
          if (todoController.todos.isEmpty) {
            return const Center(
              child: Text('Add a new todo'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: todoController.todos.length,
            itemBuilder: (context, index) {
              final todo = todoController.todos[index];
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
                      todoController.removeTodo(
                        index,
                      );
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
