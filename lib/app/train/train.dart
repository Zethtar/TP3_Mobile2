import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';

class Train extends StatefulWidget {
  @override State<StatefulWidget> createState() => TrainState();
}

class TrainState extends State<Train> {

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(child: Card(
        child: FittedBox(child: Text("う"), fit: BoxFit.contain,),),),
        getButtonsWidget()
    ],
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,);
  }

  Widget getButtonsWidget() {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, position) {
      return FlatButton(child: Text("A"), disabledColor: Colors.red,);
    });
  }
}