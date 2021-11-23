// ignore_for_file: prefer_const_constructors

import 'package:app_21/services/api.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cepController = TextEditingController();
  String cep = "";
  String logradouro = "";
  String bairro = "";
  String localidade = "";
  String uf = "";

  _recuperarCep() async {
    var api = Api();
    var retorno = await api.getCep(cepController.text);


    if (retorno.isNotEmpty) {
      setState(() {
        cep = retorno["cep"];
        logradouro = retorno["logradouro"];
        bairro = retorno["bairro"];
        localidade = retorno["localidade"];
        uf = retorno["uf"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta de CEP"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o CEP",
                labelStyle: TextStyle(color: Colors.black38),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              controller: cepController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _recuperarCep,
                  child: Text(
                    "Obter endereço",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "CEP: $cep",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Logradouro: $logradouro",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Bairro: $bairro",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Cidade: $localidade",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Estado: $uf",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
