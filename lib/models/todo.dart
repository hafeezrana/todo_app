class Todo {
  final String task;

  Todo({
    required this.task,
  });

  Todo copyWith({
    String? task,
  }) {
    return Todo(
      task: task ?? this.task,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo && other.task == task;
  }

  @override
  int get hashCode => task.hashCode;

  @override
  String toString() => 'Todo(task: $task)';
}
