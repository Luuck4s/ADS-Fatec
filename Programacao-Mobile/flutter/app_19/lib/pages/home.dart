import 'package:app_19/classes/Database.dart';
import 'package:app_19/pages/addTask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tasks = [];
  var database = DatabaseHelper();

  handleGetTasks() async{
    var tasks = await database.getAllTasks();
    setState(() {
      this.tasks = tasks;
    });
  }

  @override
  void initState() {
    super.initState();
    this.handleGetTasks();
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    super.didUpdateWidget(oldWidget);
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
          return ListTile(
            title: Text(tasks[index].title),
            trailing: GestureDetector(
              onTap: () async {
                var task = tasks[index];
                await database.deleteTask(task.id);
                this.handleGetTasks();
              },
              child: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}

class Task {
  final id;
  final title;

  Task(this.id, this.title);
}
