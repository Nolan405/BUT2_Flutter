import 'package:dev_mobile/models/task.dart';
import 'package:flutter/material.dart';
import '../viewModel/TaskViewModel.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.redAccent,
            backgroundColor: Colors.green,
          ),
          onPressed: () {
            context.read<TaskViewModel>().addTask(Task.newTask());
            Navigator.pop(context);
          },
          child: const Text("Add Task",
          style: TextStyle(color: Colors.black)),
        ),
      ),
    ) ;
  }
}
