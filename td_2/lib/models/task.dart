import 'dart:math';

class Task {
  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;

  Task({required this.id,required this.title,required this.tags,required
  this.nbhours,required this.difficulty,required this.description});

  static List<Task> generateTask(int i){
    List<Task> tasks=[];
    for(int n=0;n<i;n++){
      var rng = Random();
      var nb = rng.nextInt(6) + 1;
      tasks.add(
          Task(id: n, title: "title $n", tags: ['tag $n','tag${n+1}'],
          nbhours: nb, difficulty: n, description: '$n')
      );
    }
    return tasks;
  }
}