import 'dart:html';
import 'dart:math';

import 'package:app_16/pages/experience.dart';
import 'package:app_16/pages/formation.dart';
import 'package:app_16/pages/personal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;

  final screens = [
    Center(child: Text("Home")),
    Formation(),
    Experience(),
    Personal()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.white,
      body: screens[_currentPage],
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Lucas Andrade'),
              accountEmail: Text('lucas.lima96@fatec.sp.gov.br'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black87,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/47486438?v=4'),
              ),
            ),
            ListTile(
              title: Text("Home"),
              subtitle: Text('Tela Home'),
              trailing: Icon(Icons.home),
              onTap: () {
                setState(() {
                  _currentPage = 0;
                });
              },
            ),
            ListTile(
              title: Text("Formação"),
              subtitle: Text('Tela Formação'),
              trailing: Icon(Icons.school),
              onTap: () {
                setState(() {
                  _currentPage = 1;
                });
              },
            ),
            ListTile(
              title: Text("Experiência"),
              subtitle: Text('Tela Experiência'),
              trailing: Icon(Icons.work),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                });
              },
            ),
            ListTile(
              title: Text("Pessoal"),
              subtitle: Text('Tela Pessoal'),
              trailing: Icon(Icons.person),
              onTap: () {
                setState(() {
                  _currentPage = 3;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
