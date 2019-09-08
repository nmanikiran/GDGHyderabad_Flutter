class Todo {
  final int id;
  final String title;

  Todo({this.id, this.title});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }
}
