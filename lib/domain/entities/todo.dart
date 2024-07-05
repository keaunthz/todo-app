import 'dart:convert';

const String tableTodo = "todo";

class TodoField {
  static final List<String> values = [id, title, isDone];

  static const String id = '_id';
  static const String title = 'title';
  static const String isDone = 'isDone';
}

class Todo {
  final int? id;
  final String title;
  final bool isDone;

  Todo({
    this.id,
    required this.title,
    required this.isDone,
  });

  Todo copyWith({
    int? id,
    String? title,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      TodoField.id: id,
      TodoField.title: title,
      TodoField.isDone: isDone ? 1 : 0,
    };
  }

  static Todo fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map[TodoField.id],
      title: map[TodoField.title],
      isDone: map[TodoField.isDone] == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);
}
