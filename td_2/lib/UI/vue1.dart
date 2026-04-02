import 'package:dev_mobile/UI/DetailScreen.dart';
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
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildNavButton(context, Icons.remove_red_eye, Detailscreen(task: _listTasks[index])),
                  buildNavButton(context, Icons.edit, Scaffold(
                                                        appBar: AppBar(title: const Text("Édition")),
                                                        body: const Center(child: Text("Pas encore implémenté")),
                  )),
                  IconButton(
                    icon: Icon(Icons.restore_from_trash),
                    onPressed: () {
                      context.read<TaskViewModel>().removeTask(
                        _listTasks[index],
                      );
                    },
                  )
                ]
              )
            ),
          );
        },
      )
      : const Center(
        child: Text('No items'),
      );
  }

  Widget buildNavButton(BuildContext context, IconData icon, Widget destination) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
    );
  }
}