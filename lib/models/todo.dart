class ToDo {
  final int? id;
  final int userId;
  final String title;
  final bool completed;

  ToDo(
      {required this.id,
      required this.userId,
      required this.title,
      required this.completed});

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
        id: json["id"] as int,
        userId: json["userId"] as int,
        title: json["title"] as String,
        completed: json["completed"] as bool);
  }

  ToDo copyWith({int? id, int? userId, String? title, bool? completed}) {
    return ToDo(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        completed: completed ?? this.completed);
  }

  ToDo toggleComplete() {
    return copyWith(completed: !completed);
  }

  @override
  bool operator ==(Object other) {
    return other is ToDo &&
        (other.id == id &&
            other.userId == userId &&
            other.title == title &&
            other.completed == completed);
  }

  @override
  int get hashCode {
    return [id, userId, title, completed].hashCode;
  }
}
