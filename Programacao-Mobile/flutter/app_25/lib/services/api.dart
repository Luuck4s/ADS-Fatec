import 'dart:ffi';

import 'package:app_25/pages/home.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

String baseURL = 'https://tarefa-backend.herokuapp.com/tasks';

class Api {
  getAllTasks() async {
    String url = '$baseURL';

    http.Response response = await http.get(Uri.parse(url));
    List retorno = json.decode(response.body);

    List<Task> lista = [];

    for (var task in retorno) {
      lista.add(Task(
          task["id"], task["title"], task["description"], task["finished"]));
    }

    return lista;
  }

  deleteTask(id) async {
    String url = '$baseURL/$id';

    http.Response response = await http.delete(Uri.parse(url));
    var retorno = json.decode(response.body);

    return retorno;
  }

  saveTask(task) async {
    String url = '$baseURL';

    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: json.encode(task),
    );
    
    var retorno = json.decode(response.body);
    
    return retorno;
  }

  updateTask(task) async {
    String url = '$baseURL/${task["id"]}';

    http.Response response = await http.put(
      Uri.parse(url),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: json.encode(task),
    );
    
    var retorno = json.decode(response.body);
    
    return retorno;
  }
}
