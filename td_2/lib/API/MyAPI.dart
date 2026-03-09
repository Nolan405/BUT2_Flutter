import 'dart:convert';
import 'package:dev_mobile/models/task.dart';
import 'package:flutter/services.dart';

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

  Future<String> _loadData(String path) async {
    return rootBundle.loadString(path);
  }
}