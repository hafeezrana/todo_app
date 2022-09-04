import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo.dart';

import 'todo_notifier.dart';

class EditTodoView extends ConsumerStatefulWidget {
  const EditTodoView({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  _EditTodoViewState createState() => _EditTodoViewState();
}

class _EditTodoViewState extends ConsumerState<EditTodoView> {
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
                ref.read(todoNotifierProvider.notifier).updateTodo(
                      id: widget.todo.id!,
                      task: taskController.text,
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
