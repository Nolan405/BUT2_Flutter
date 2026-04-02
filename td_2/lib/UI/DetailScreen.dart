import 'package:flutter/material.dart';

import '../models/task.dart';

class Detailscreen extends StatelessWidget {
  final Task task;

  Detailscreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails"),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID : ${task.id}"),
            Text("Titre : ${task.title}"),
            Text("Heures : ${task.nbhours}"),
            Text("Difficulté : ${task.difficulty}"),
            Text("Description : ${task.description}"),
            Text("Tags : ${task.tags.join(', ')}"),
          ],
        ),
    );
  }
}