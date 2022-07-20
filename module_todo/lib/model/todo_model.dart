class Todo {
  String? todo;

  Todo();

  Map<String, dynamic> toJson() => {'todo': todo};

  Todo.fromSnapshot(snapshot) : todo = snapshot.data()['todo'].toDate();
}