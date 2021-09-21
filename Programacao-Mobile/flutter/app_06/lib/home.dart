import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;

  void _plusCount(){
    setState(() {
      count += 1;
    });
  }

  void _minusCount(){
    setState(() {
      if(count > 0){
        count -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador de Pessoas"),
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
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget> [
          RaisedButton(color: Colors.red, onPressed: this._minusCount,
          child: Text(
            "-",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40
            )
            ),
          ),
          Text(this.count.toString(), style: TextStyle(
            fontSize: 80
          )),

          RaisedButton(color: Colors.green, onPressed: this._plusCount,
            child: Text(
                "+",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40
                )
            ),
          )
        ],
      )
    );
  }
}
  

