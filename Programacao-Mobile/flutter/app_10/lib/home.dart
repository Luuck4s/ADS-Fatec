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
  int numero = new Random().nextInt(10);
  String result = "";

  void _setResult(){
    setState(() {
      if(double.parse(n1Controller.text) == numero){
        result = "Você acertou o número é ${numero}";
      }else {
        result = "Você errou o número é ${numero}";
      }

      numero = new Random().nextInt(10);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo do número Aleatório"),
        centerTitle: true,
        backgroundColor: Colors.purple,
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
            _campo('Pense em um número de 0 a 10', n1Controller),
            RaisedButton(color: Colors.purpleAccent, onPressed: this._setResult,
              child: Text(
                  "Descobrir",
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
            Text("${result}", style: TextStyle(
              fontSize: 20,
            )),
          ],
        )
    );
  }

  _foto(){
    return Center(
      child: Image.network(
        "https://www.teusonhar.com.br/wp-content/uploads/2015/07/sonhar-com-dado.png",
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
