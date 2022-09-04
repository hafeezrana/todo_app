class Todo {
  final String? id;
  final String task;

  Todo({
    this.id,
    required this.task,
  });

  Todo copyWith({
    String? id,
    String? task,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo && other.id == id && other.task == task;
  }

  @override
  int get hashCode => id.hashCode ^ task.hashCode;

  @override
  String toString() => 'Todo(id: $id, task: $task)';
}
