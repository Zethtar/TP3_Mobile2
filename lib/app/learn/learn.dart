import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';

class Learn extends StatelessWidget {
  var _valuesList = Hiraganas.values.toList();
  var _keysList = Hiraganas.keys.toList();

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      itemCount: Hiraganas.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: GridTile(
            footer: Text(_valuesList[index], textAlign: TextAlign.center, textScaleFactor: 1.5,),
            child: FittedBox (child : Text(_keysList[index])),
          ),
        );
      },
    );
  }
}
