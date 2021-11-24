// ignore_for_file: file_names

import 'package:app_25/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'home.dart';


class EditTask extends StatefulWidget {
  const EditTask({Key? key, required this.task}) : super(key: key);
  final Task task;
  @override
  _EditTaskState createState() => _EditTaskState(task);
}

class _EditTaskState extends State<EditTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Task task;

  _EditTaskState(this.task){}

  var api = Api();

  @override
  void initState() {
    super.initState();

    titleController.text = this.task.title;
    descriptionController.text = this.task.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Editar Tarefa"),
        ),
        body: Container(
          child: Column(
            children: [_buildForm()],
          ),
        ));
  }

  Widget _buildForm() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Nome da tarefa",
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 20),
              controller: titleController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Descrição da tarefa",
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 20),
              controller: descriptionController,
            ),
          ),
          
          ElevatedButton(
              onPressed: () async {
                var newTask = {
                  "id": task.id,
                  "title": titleController.text,
                  "description": descriptionController.text,
                };
                await api.updateTask(newTask);
                Navigator.pop(context);
              },
              child: Text("Salvar Tarefa"))
        ],
      ),
    );
  }
}
