import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';

class Train extends StatefulWidget {
  @override State<StatefulWidget> createState() => TrainState();
}

class TrainState extends State<Train> {
  var _correctIndex = 0;
  var _isButtonDisabled = [false, false, false];
  var _rng = Random();
  var _keysList = Hiraganas.keys.toList();

  TrainState() {
    _keysList.shuffle();
    _correctIndex = _rng.nextInt(3);
  }

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
      itemCount: 3,
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
      _correctIndex = _rng.nextInt(3);
    });
  }
}