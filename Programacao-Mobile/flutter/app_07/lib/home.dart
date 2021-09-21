import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  double result = 0;

  void _setResult(){
    setState(() {
      result = double.parse(n1Controller.text) * double.parse(n2Controller.text);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiplicação 2 números"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
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
            _campo('Primeiro número', n1Controller),
            _campo('Segundo número', n2Controller),
            RaisedButton(color: Colors.green, onPressed: this._setResult,
              child: Text(
                  "Multiplicar",
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
            Text("O Resultado é ${result}", style: TextStyle(
                fontSize: 20
            )),
          ],
        )
    );
  }

  _campo(label, controller){
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.green,
        ),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 20),
      controller: controller
    );
  }
}


