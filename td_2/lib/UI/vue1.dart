import 'package:flutter/material.dart';
import 'package:dev_mobile/models/task.dart';
import 'package:provider/provider.dart';
import '../viewModel/TaskViewModel.dart';

class Vue1 extends StatelessWidget {
  Vue1({super.key});
  late List<Task> _listTasks;
  final List<int> colorCodes = <int>[700, 400];

  @override
  Widget build(BuildContext context) {
    _listTasks = context.watch<TaskViewModel>().liste;
    return _listTasks.isNotEmpty
      ? ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: _listTasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                title: Text(_listTasks[index].title),
                tileColor: Colors.green[colorCodes[index % 2]],
                subtitle: Text('${_listTasks[index].nbhours} hours'),
                trailing: Icon(Icons.more_vert),
              ),
          );
        }
    )
    : const Center(
        child: Text('No items')
    );
  }
}