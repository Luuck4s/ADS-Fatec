import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  String result = "";

  void _setResult(){
    setState(() {
      var imc = double.parse(n1Controller.text) / pow(double.parse(n2Controller.text), 2);

      if(imc < 18.5){
        result = "Abaixo do Peso";
      }else if(imc <= 24.9){
        result = "Peso Normal";
      }else if(imc <= 29.9){
        result = "Sobrepeso";
      }else if(imc <= 34.9) {
        result = "Obesidade Grau I";
      }else if(imc <= 39.9){
        result = "Obesidade Grau II";
      }else if(imc >= 40){
        result = "Obesidade Grau III Ou Mórbida";
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo IMC"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _corpo(){
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            _foto(),
            _campo('Peso', n1Controller),
            _campo('Altura', n2Controller),
            RaisedButton(color: Colors.green, onPressed: this._setResult,
              child: Text(
                  "Verificar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  )
              ),
              padding: EdgeInsets.only(
                  top: 15,
                  left: 20,
                  bottom: 15,
                  right: 20
              ),
            ),
            Text("Classificação ${result}", style: TextStyle(
                fontSize: 20,
            )),
          ],
        )
    );
  }

  _foto(){
    return Center(
      child: Image.network(
        "https://lh3.googleusercontent.com/proxy/RC1SbB2oqLp9SXCJ07buGjqooShC1ToXhjCFlbxgSwQvS-IJlm-LiY1qx9y7LyTy-7rRcfxjeJlY5JjMiCfeuddF3v2P7UlkNYb6d0cUlUWU9CSk8QWvkAQ",
        width: 300,
        height: 300,
      ),
    );
  }

  _campo(label, controller){
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.redAccent,
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.green, fontSize: 20),
        controller: controller
    );
  }
}


