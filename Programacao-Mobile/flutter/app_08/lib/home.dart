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
  String result = "";

  void _setResult(){
    setState(() {
      var result =  double.parse(n1Controller.text) / double.parse(n2Controller.text);

      if(result <= 0.7){
        this.result = "Alcool";
      }else {
        this.result = "Gasolina";
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
            _campo('Preço do Alcool', n1Controller),
            _campo('Preço da Gasolina', n2Controller),
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
            Text("Vale a pena escolher: ${result}", style: TextStyle(
                fontSize: 20
            )),
          ],
        )
    );
  }

  _foto(){
    return Center(
      child: Image.network(
        "https://lh3.googleusercontent.com/N14whk_Ez-j6rSbkFUF8THC11vzTH2HdSWqQO8CiT8p3RrAfodUASk43lKrSGqujRbI=s200",
        width: 150,
        height: 150,
      ),
    );
  }

  _campo(label, controller){
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.blue,
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.green, fontSize: 20),
        controller: controller
    );
  }
}


