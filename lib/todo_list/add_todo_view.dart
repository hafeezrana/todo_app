import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/todo_list/todo_provider.dart';

class AddTodoView extends StatefulWidget {
  const AddTodoView({
    Key? key,
  }) : super(key: key);

  @override
  _AddTodoViewState createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final taskController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    taskController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoController = TodoProvider.of(context).todoController;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
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
                final createdTodo = Todo(task: taskController.text);
                setState(() {
                  todoController.createTodo(createdTodo);
                });
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
