import 'package:flutter/material.dart';
import 'package:tp3/util/strings.dart';
import 'package:tp3/app/train/train.dart';
import 'package:tp3/app/learn/learn.dart';


class Home extends StatefulWidget {
  @override State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var strings = Strings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.title),
      ),
      body: Center(
        child: IndexedStack(children: <Widget>[
          Learn(),
          Train()
        ], index: _selectedIndex,),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.class_), title: Text(strings.learn)),
          BottomNavigationBarItem(icon: Icon(Icons.create), title: Text(strings.train)),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.red,
        onTap: _onNavigationBarItemTapped,
      ),
    );
  }

  void _onNavigationBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
