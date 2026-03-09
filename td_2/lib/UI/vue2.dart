import 'package:flutter/material.dart';
import 'package:dev_mobile/API/MyAPI.dart';
import 'package:dev_mobile/models/task.dart';

class Vue2 extends StatelessWidget {
  final Future<List<Task>> _listTasks = MyAPI().getTask();
  final List<int> colorCodes = <int>[700, 400];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _listTasks,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.green),
          );
        }
        if (asyncSnapshot.hasError) {
          return Center(child: Text("Error: ${asyncSnapshot.error}"));
        }
        if (asyncSnapshot.hasData && asyncSnapshot.data!.isNotEmpty) {
          return ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: asyncSnapshot.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  title: Text(asyncSnapshot.data![index].title),
                  tileColor: Colors.green[colorCodes[index % 2]],
                  subtitle: Text(
                      '${asyncSnapshot.data![index].nbhours} hours'),
                  trailing: Icon(Icons.more_vert),
                ),
              );
            }
          );
        }
        return const Center(child: Text("La liste est vide"));
      }
    );
  }
}