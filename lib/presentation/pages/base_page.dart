import 'package:flutter/material.dart';
import 'package:flutter_playstore/presentation/pages/pages.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentPages = 0;

  void _changeCurrentPages(value) {
    setState(() {
      currentPages = value;
    });
  }

  List<Widget> bodyList = [
    HomePage(),
    GamePage(),
    DatePage(),
  ];

  Widget getBody() => bodyList[currentPages];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changeCurrentPages,
        currentIndex: currentPages,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: "Games"),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Apps"),
        ],
      ),
    );
  }
}
