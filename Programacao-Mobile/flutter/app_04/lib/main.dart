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
        backgroundColor: Colors.red,
        title: Text("App 04"),
      ),
      body: Container(
        child: Center(
            child: Text("Hello Lucas",
                style: TextStyle(
                    fontSize: 45,
                    color: Colors.black45,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.black12,
                    decorationStyle: TextDecorationStyle.dotted))),
      ),
    );
  }
}
