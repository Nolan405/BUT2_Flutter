import 'dart:convert';
import 'package:dev_mobile/models/task.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class MyAPI {

  Future<List<Task>> getTask() async {
    final dataString = _loadData('data/tasks.json');
    final Map<String, dynamic> json = jsonDecode(await dataString);
    if (json['tasks']!=null) {
      final tasks = <Task>[];
      json['tasks'].forEach((element) {
        tasks.add(Task.fromJson(element));
      });
      return tasks;
    } else {
      return [];
    }
  }

  Future<List<Task>> fetchTask() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      final tasks = <Task>[];
      json.forEach((element) {
        tasks.add(Task.todoFromJson(element));
      });
      return tasks;
    } else {
      return [];
    }
  }

  Future<String> _loadData(String path) async {
    return rootBundle.loadString(path);
  }
}