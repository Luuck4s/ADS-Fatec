import 'dart:ffi';
import 'dart:io';

import 'package:app_26/pages/addCracha.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../classes/Database.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var crachas = [];
  var database = DatabaseHelper();

  handleGetAll() async {
    var crachas = await database.getAll();
    setState(() {
      this.crachas = crachas;
    });
  }

  @override
  void initState() {
    super.initState();
    handleGetAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criação de Crachás"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCracha()),
          ).then((value) => handleGetAll());
        },
        child: Icon(Icons.plus_one),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: this.crachas.length,
        itemBuilder: (BuildContext context, int index) {
          Cracha cracha = crachas[index];

          
          return ListTile(
              title: Text(cracha.name),
              subtitle: Text(cracha.area),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await database.delete(cracha.id);
                      handleGetAll();
                    },
                  ),
                ],
              ));
        },
      ),
    );
  }
}

class Cracha {
  final id;
  final name;
  final area;
  final picture;

  Cracha(this.id, this.name, this.area, this.picture);
}
