// ignore_for_file: file_names

import 'dart:io';

import 'package:app_26/classes/Database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'home.dart';

class AddCracha extends StatefulWidget {
  const AddCracha({Key key}) : super(key: key);

  @override
  _AddCrachaState createState() => _AddCrachaState();
}

class _AddCrachaState extends State<AddCracha> {
  TextEditingController titleController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  String path_foto = 'Tire uma foto';
  File file;

  var database = DatabaseHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Novo Crachá"),
        ),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    path_foto,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  file != null
                      ? Image.file(file)
                      : Image.asset(
                          "assets/images/camera.png",
                          height: 150,
                        ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              size: 60,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              _getImagemFromCamera();
                            }),
                        SizedBox(
                          width: 60,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.image,
                              size: 60,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              _getImagemFromGaleria();
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildForm()
          ],
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
                labelText: "Nome",
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
                labelText: "Área",
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 20),
              controller: areaController,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                var newCracha = Cracha(null, titleController.text, areaController.text,  path_foto);
                await database.save(newCracha);
                Navigator.pop(context);
              },
              child: Text("Adicionar Tarefa"))
        ],
      ),
    );
  }

  _getImagemFromCamera() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      this.file = foto;
      this.path_foto = foto.toString();
    });
  }

  _getImagemFromGaleria() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.file = foto;
      this.path_foto = foto.toString();
    });
  }
}
