import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: metodoHome());
  }

  metodoHome() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("App Hello"),
      ),
      body: Container(
        child: Center(
            child: Text("Hello Turma!",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.dashed))),
      ),
    );
  }
}
