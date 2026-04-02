import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../UI/vue1.dart';
import '../models/task.dart';
import '../viewModel/TaskViewModel.dart';

class Taskform extends StatelessWidget {
  const Taskform({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Add Task';

    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: const SingleChildScrollView(child: MyCustomForm()),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _difficultyController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _difficultyController.dispose();
    _hoursController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter title',
                labelText: 'Title',
                prefixIcon: Icon(Icons.task, color: Colors.green[700]),
                errorStyle: TextStyle(fontSize: 18.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter title';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: _difficultyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter difficulty',
                labelText: 'Difficulty',
                prefixIcon: Icon(Icons.task, color: Colors.green[700]),
                errorStyle: TextStyle(fontSize: 18.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter difficulty';
                }
                final difficulty = int.tryParse(value);
                if (difficulty == null) {
                  return 'Difficulty must be a number';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: _hoursController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter the number of hours',
                labelText: 'Number of hours',
                prefixIcon: Icon(Icons.task, color: Colors.green[700]),
                errorStyle: TextStyle(fontSize: 18.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter number of hours';
                }
                final hours = int.tryParse(value);
                if (hours == null) {
                  return 'Number of hours must be a number';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Enter description',
                labelText: 'Description',
                prefixIcon: Icon(Icons.task, color: Colors.green[700]),
                errorStyle: TextStyle(fontSize: 18.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter description';
                }
                return null;
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final title = _titleController.text.trim();
                      final difficulty = int.parse(_difficultyController.text);
                      final hours = int.parse(_hoursController.text);
                      final description = _descriptionController.text.trim();

                      Task task = Task.fromForm(
                        title: title,
                        nbhours: hours,
                        difficulty: difficulty,
                        description: description,
                      );
                      context.read<TaskViewModel>().addTask(task);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Task create !')),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Create'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
