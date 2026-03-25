import 'package:dev_mobile/UI/EcranSettings.dart';
import 'package:dev_mobile/viewModel/TaskViewModel.dart';
import 'package:flutter/material.dart';
import 'package:dev_mobile/UI/vue1.dart';
import 'package:dev_mobile/UI/vue2.dart';
import 'package:dev_mobile/UI/vue3.dart';
import 'package:http/http.dart';

import 'models/addTask.dart';
import 'models/task.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  final List<Widget> _vues = [Vue1(), Vue2(), Vue3(), EcranSettings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _index==0?FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => AddTask(),
          ));
        },
        child: const Icon(Icons.add),
      ):const SizedBox.shrink(),
      appBar:
      AppBar(
        title: const Text("TD 2"),
        centerTitle: true,
      ),
      body: _vues[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks1"),
          BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: "Task2"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Task3"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}