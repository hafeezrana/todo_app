import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/todo_list/todo_list_controller.dart';

class UpdateTodoView extends StatefulWidget {
  const UpdateTodoView({
    Key? key,
    required this.todoListController,
  }) : super(key: key);

  final TodoListController todoListController;

  @override
  _UpdateTodoViewState createState() => _UpdateTodoViewState();
}

class _UpdateTodoViewState extends State<UpdateTodoView> {
  final taskController = TextEditingController();

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
            TextButton(
              onPressed: () {
                final updatedTodo = Todo(task: taskController.text);
                widget.todoListController.updateTodo(updatedTodo);
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
