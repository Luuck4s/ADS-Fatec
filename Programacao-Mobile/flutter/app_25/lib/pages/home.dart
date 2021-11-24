import 'package:app_25/pages/addTask.dart';
import 'package:app_25/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'editTask.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tasks = [];
  var api = Api();

  handleGetTasks() async {
    var tasks = await api.getAllTasks();
    setState(() {
      this.tasks = tasks;
    });
  }

  @override
  void initState() {
    super.initState();
    handleGetTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          ).then((value) => handleGetTasks());
        },
        child: Icon(Icons.plus_one),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: this.tasks.length,
        itemBuilder: (BuildContext context, int index) {
          Task task = tasks[index];
          return ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditTask(task: task)),
                      ).then((value) => handleGetTasks());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await api.deleteTask(task.id);
                      handleGetTasks();
                    },
                  ),
                ],
              ));
        },
      ),
    );
  }
}

class Task {
  final id;
  final title;
  final description;
  final finished;

  Task(this.id, this.title, this.description, this.finished);
}
