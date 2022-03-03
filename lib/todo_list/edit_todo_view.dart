import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';

import 'todo_notifier.dart';

class EditTodoView extends StatefulWidget {
  const EditTodoView({
    Key? key,
    required this.todo,
    required this.currentIndex,
  }) : super(key: key);

  final Todo todo;
  final int currentIndex;

  @override
  _EditTodoViewState createState() => _EditTodoViewState();
}

class _EditTodoViewState extends State<EditTodoView> {
  final taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskController.text = widget.todo.task;
  }

  @override
  void dispose() {
    super.dispose();
    taskController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Enter Your Todo',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                final updatedTodo = Todo(task: taskController.text);
                context.read<TodoNotifier>().updateTodo(
                      widget.currentIndex,
                      updatedTodo,
                    );

                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
