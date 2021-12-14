import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/todo_list/todo_list_controller.dart';

class AddTodoView extends StatefulWidget {
  const AddTodoView({
    Key? key,
    required this.todoListController,
  }) : super(key: key);

  final TodoListController todoListController;

  @override
  _AddTodoViewState createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  TextEditingController taskController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    taskController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            TextButton(
              onPressed: () {
                final createdTodo = Todo(task: taskController.text);
                widget.todoListController.createTodo(createdTodo);
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
