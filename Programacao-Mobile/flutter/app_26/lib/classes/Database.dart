
// ignore: file_names
// ignore_for_file: unnecessary_this

import 'package:app_26/pages/addCracha.dart';
import 'package:app_26/pages/home.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper{
  getDatabase() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco-crachas.db");

    var database = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE cracha (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, area VARCHAR, picture VARCHAR) ";
      db.execute(sql);
    });

    return database;
  }

  getAll() async {
    Database bd = await this.getDatabase();

    String sql = "SELECT * FROM cracha";
    List crachaDb = await bd.rawQuery(sql);
    List<Cracha> crachas = [];

    for (var cracha in crachaDb) {
      crachas.add(Cracha(cracha["id"], cracha["name"], cracha["area"], cracha["picture"]));
    }

    return crachas;
  }

  save(cracha) async {
    Database bd = await this.getDatabase();

      Map<String, dynamic> dadosTask = {
        "area": "${cracha.area}",
        "name": "${cracha.name}",
        "picture": "${cracha.picture}",
      };
      return await bd.insert("cracha", dadosTask);
  }

  delete(id) async {
    if (id != null) {
      Database bd = await this.getDatabase();
      return await bd.rawQuery("DELETE FROM  cracha where id = $id");
    }
  }
}