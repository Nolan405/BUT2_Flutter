import 'dart:math';

class Task {
  static int nb = 0;

  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;

  Task({
    required this.id,
    required this.title,
    required this.tags,
    required this.nbhours,
    required this.difficulty,
    required this.description,
  });

  Task.todo({required this.id, required this.title})
    : tags = [],
      nbhours = 0,
      difficulty = 1,
      description = "";

  factory Task.todoFromJson(Map<String, dynamic> json) {
    return Task.todo(id: json['id'], title: json['title']);
  }

  factory Task.newTask() {
    nb++;
    return Task(
      id: nb,
      title: 'title $nb',
      tags: ['tags $nb'],
      nbhours: nb,
      difficulty: nb % 5,
      description: 'description $nb',
    );
  }

  factory Task.fromForm({
    required String title,
    required int nbhours,
    required int difficulty,
    required String description,
  }) {
    nb++;
    return Task(
      id: nb,
      title: title,
      tags: [],
      nbhours: nbhours,
      difficulty: difficulty,
      description: description,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      tags: List<String>.from(json['tags']),
      nbhours: json['nbhours'],
      difficulty: json['difficulty'],
      description: json['description'],
    );
  }

  static List<Task> generateTask(int i) {
    List<Task> tasks = [];
    for (int n = 0; n < i; n++) {
      var rng = Random();
      var nb = rng.nextInt(6) + 1;
      tasks.add(
        Task(
          id: n,
          title: "title $n",
          tags: ['tag $n', 'tag${n + 1}'],
          nbhours: nb,
          difficulty: n,
          description: '$n',
        ),
      );
    }
    return tasks;
  }
}
