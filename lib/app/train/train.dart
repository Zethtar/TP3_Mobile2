import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';

class Train extends StatefulWidget {
  @override State<StatefulWidget> createState() => TrainState();
}

class TrainState extends State<Train> {
  static const int CHOICE_COUNT = 3;
  var _correctIndex = 0;
  //BEN_CORRECTION : Tableau hardcodé compte, surtout sachant qu'il y a une constante plus haut
  //                 qui permet de déterminer la taille de ce tableau.
  var _isButtonDisabled = [false, false, false];
  var _keysList = Hiraganas.keys.toList();

  TrainState() {
    //BEN_CORRECTION : Duplication de code. Voir fonction "_updateHiragana".
    _keysList.shuffle();
    _correctIndex = Random().nextInt(CHOICE_COUNT);
  }

  //BEN_CORRECTION : Indentation de la méthode "build" rend difficile la lecture de la structure.
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(child: Card(
        child: FittedBox(child: Text(_keysList[_correctIndex]), fit: BoxFit.contain,),),),
        _buildButtonsWidget()
    ],
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,);
  }

  Widget _buildButtonsWidget() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(8.0),
      itemCount: CHOICE_COUNT,
      itemExtent: 20.0,
      itemBuilder: (BuildContext context, int index) {
        Function onPressed = index == _correctIndex ? _updateHiragana : () => _disableButton(index);
        return FlatButton(child: Text(Hiraganas[_keysList[index]], style: TextStyle(color: _isButtonDisabled[index] ? Colors.red : Colors.black),),
          onPressed: _isButtonDisabled[index] ? null : onPressed,);
      },
    );
  }

  void _disableButton(int index) {
    setState(() {
      _isButtonDisabled[index] = true;
    });
  }

  void _updateHiragana() {
    setState(() {
      _keysList.shuffle();
      _isButtonDisabled = [false, false, false];
      _correctIndex = Random().nextInt(CHOICE_COUNT);
    });
  }
}